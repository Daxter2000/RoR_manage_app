class ClientsController < ApplicationController
  
  before_action  :authenticate_user!, :authenticate_has_company!
  before_action :set_client, only: %i[ show edit update destroy ]
  before_action :set_current_user
  # GET /clients or /clients.json
  def index
    @clients = Client.where(:company_id => @current_user.user_company.company_id)
  end

  # GET /clients/1 or /clients/1.json
  def show
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients or /clients.json
  def create
    @client = Client.new(client_params)
    @client.company_id = @current_user.user_company.company_id

    respond_to do |format|
      if @client.save
        format.html { redirect_to client_url(@client), notice: "Client was successfully created." }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1 or /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to client_url(@client), notice: "Client was successfully updated." }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1 or /clients/1.json
  def destroy
    @client.destroy

    respond_to do |format|
      format.html { redirect_to clients_url, notice: "Client was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      client = Client.find(params[:id])
      if client.company_id == @current_user.user_company.company.id
        @client = client
      else 
        redirect_to root_path
      end
    end

    # Only allow a list of trusted parameters through.
    def client_params
      params.require(:client).permit(:names, :ap_pat, :ap_mat, :tel, :channel, :company_id)
    end


end
