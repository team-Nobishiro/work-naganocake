class Public::OrdersController < ApplicationController

  def new
  	@order = Order.new
  	@shipping_address_new = ShippingAddress.new
  	@shipping_addresses = current_end_user.shipping_addresses
  end

  def create
  	session[:payment_way] = params[:payment_way]
    if params[:select] == "select_address"
      session[:address] = params[:address]
    elsif params[:select] == "my_address"
      session[:address] ="〒" +current_end_user.postal_code+current_end_user.address+current_end_user.last_name+current_end_user.first_name
    end
    if session[:address].present? && session[:payment_way].present?
      redirect_to public_orders_confirm_path
    else
      flash[:order_new] = "支払い方法または配送先を選択して下さい"
      redirect_to public_new_order_path
    end
  end

  def confirm
  	@orders = current_end_user.orders
  end

  def index
  end

  def show
  	@shipping_address_new = ShippingAddress.new
  end

  def thank
  end

  private
  def order_params
  	params.require(:order).permit(:end_user_id, :select, :toral_price, :send_price, :payment_way)
  end
  def shipping_address_params
  	params.require(:shipping_address).permit(:postal_code, :address, :address_name)
  end

end