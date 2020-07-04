class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :phone_number, :postal_code, :address ])
  end
  def after_sign_in_path_for(resource)
 admin_home_about_path
end
def after_sign_out_path_for(resource)
 master_session_path
end
end
