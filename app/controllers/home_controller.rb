class HomeController < ApplicationController
  before_action :authenticate_user!
  before_action :has_a_company!


  def index

  end

  private
  
  def has_a_company!
    company_data = UserCompany.where(:user_id => current_user)
    redirect_to new_company_path unless user_signed_in? && !company_data.blank?
  end

end
