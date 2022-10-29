class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  
  def authenticate_editor!
    redirect_to root_path unless user_signed_in? && current_user.is_editor?  
  end

  def authenticate_admin!
    redirect_to root_path unless user_signed_in? && current_user.is_admin?  
  end

  def authenticate_has_company!
    redirect_to root_path unless user_signed_in? && current_user.has_company?
  end

  def duplicate_company!
    redirect_to root_path unless user_signed_in? && current_user.duplicate_company?
  end
  
  def set_current_user
    @current_user = current_user
  end



end
