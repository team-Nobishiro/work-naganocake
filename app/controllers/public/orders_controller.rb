class Public::OrdersController < ApplicationController
  def index
    # @orders = Order.order('id DESC').limit(8)
    @end_user = current_end_user
    @orders = current_end_user.orders.order(created_at: :desc)
  end
  
  def show
    @order = current_end_user.orders.find(params[:id])
    @end_user = EndUser.find(params[:id])
    @shipping_address_new = ShippingAddress.new
  end

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
      redirect_to order_confirm_path
    else
      flash[:order_new] = "支払い方法と配送先を選択して下さい"
      redirect_to new_public_order_path
    end
  end

  def confirm
  	@orders = current_end_user.orders
  end

  def index
  end

  def show
  	
  end

  

  private
  def order_params
    params.require(:order).permit(:end_user_id, :select, :toral_price, :send_price,
                                  :payment_way, :postal_code, :address, :address_name)
  end
  def shipping_address_params
  	params.require(:shipping_address).permit(:postal_code, :address, :address_name)
  end

end
