class Public::OrdersController < ApplicationController
  def index
    # @orders = Order.order('id DESC').limit(8)
    @end_user = current_end_user
    @orders = current_end_user.orders.order(created_at: :desc)
    @toral_price = current_end_user.cart_total_price + @send_price
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

  def confirm
    session[:order] = Order.new
  	session[:order][:payment_way] = params[:payment_way]
    @send_price = 800
    @toral_price = current_end_user.cart_total_price + @send_price
    @end_user_id = current_end_user.id

    if params[:select] == "select_address"
      shipping_address = ShippingAddress.find(params[:address])
      session[:order][:address] = shipping_address.address
      session[:order][:address_name] = shipping_address.address_name
      session[:order][:postal_code] = shipping_address.postal_code
 
    elsif params[:select] == "my_address"
      # session[:address] ="〒" +current_end_user.postal_code+current_end_user.address+current_end_user.last_name+current_end_user.first_name
      session[:order][:address] = current_end_user.address
      session[:order][:address_name] = current_end_user.last_name + current_end_user.first_name
      session[:order][:postal_code] = current_end_user.postal_code
    
    else params[:select] == "new_address"
      session[:order][:address] = params[:shipping_address][:address]
      session[:order][:address_name] = params[:shipping_address][:address_name]
      session[:order][:postal_code] = params[:shipping_address][:postal_code]
     
    end

    @postal_code = session[:order][:postal_code]
    @address = session[:order][:address]
    @address_name = session[:order][:address_name]
    
    if session[:order][:address].present? && session[:order][:payment_way].present?
      # redirect_to order_confirm_path
    else

      flash[:order_new] = "支払い方法または配送先を選択して下さい"
      redirect_to public_new_order_path
    end
  end

  def create
    @order = Order.new(session[:order])
    @order.select = 0
    @order.end_user_id = current_end_user.id
    @order.toral_price = current_end_user.cart_total_price
    @order.save
    @cart_items = current_end_user.cart_items
    @cart_items.destroy_all
    redirect_to public_orders_thank_path
  end 

  # def confirm
  	# @orders = current_end_user.orders
  # end
  
  def thank
  end

  private
  def order_params
    params.require(:order).permit(:toral_price, :select, :payment_way, :postal_code, :address, :address_name)
  end
  def shipping_address_params
  	params.require(:shipping_address).permit(:postal_code, :address, :address_name)
  end

end