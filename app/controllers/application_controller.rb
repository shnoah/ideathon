class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception 이거 어떡하지?
  
  before_filter :configure_permitted_parameters, if: :devise_controller?
  
  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password , :university) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :university, :current_password, :is_female, :date_of_birth) }
  end
  
  def after_sign_in_path_for(resource)
    "/article_board/main_board"
  end
  
  def after_sign_out_path_for(resource)
    "/article_board/main_board"
  end
end
