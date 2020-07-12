class ApplicationController < ActionController::Base
   protect_from_forgery
before_action :configure_permitted_parameters, if: :devise_controller?
 
  def after_sign_in_path_for(resource)
    if end_user_signed_in?
      root_path
    else
      admin_homes_top_path
    end
  end

  def after_sign_out_path_for(resource)
    case resource
    when :end_user
      root_path
    when :master
      new_master_session_path
    end
  end

 protect_from_forgery with: :exception

  helper_method :current_cart
#カート関連
  def current_cart
    if session[:cart_id]
      @cart = Cart.find(session[:cart_id])
    else
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
  end
#カートここまで
protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :phone_number, :postal_code, :address ])
  end
end
