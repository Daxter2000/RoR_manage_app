class CompaniesController < ApplicationController
  before_action :set_current_user, :authenticate_admin!
  before_action :duplicate_company!, only: %i[ new ]
  before_action :set_company, only: %i[ show edit update destroy ]
  # GET /companies or /companies.json
  def index
    @companies = Company.all
  end

  # GET /companies/1 or /companies/1.json
  def show
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies or /companies.json
  def create
    @company = Company.new(company_params)
    if @company.save!
      p "ALFREDO"
      p @current_user    
      new_user_company = UserCompany.new
      new_user_company.user_id = @current_user.id
      new_user_company.company_id = @company.id
      new_user_company.save!
      
      respond_to do |format|
        if @company.persisted?
          format.html { redirect_to company_url(@company), notice: "Company was successfully created." }
          format.json { render :show, status: :created, location: @company }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @company.errors, status: :unprocessable_entity }
        end
      end
    end  
  end

  # PATCH/PUT /companies/1 or /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to company_url(@company), notice: "Company was successfully updated." }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1 or /companies/1.json
  def destroy
    @company.destroy

    respond_to do |format|
      format.html { redirect_to companies_url, notice: "Company was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      if params[:id].to_i == @current_user.user_company.company.id
        @company =  Company.find(params[:id])
      else 
        redirect_to root_path
      end 
    end

    # Only allow a list of trusted parameters through.
    def company_params
      params.require(:company).permit(:name, :RFC, :adress, :logo)
    end

end
