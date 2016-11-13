class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_family

  private
  def logged_in_user
    unless user_signed_in?
      # stored_location
      flash[:danger] = 'Please log in'
      redirect_to new_user_session_url
    end
  end

  def current_family
    @current_family ||= Family.find(current_user.family_id)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:open_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:open_id])
  end
end
