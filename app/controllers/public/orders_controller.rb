class Public::OrdersController < ApplicationController
  def index
    # @orders = Order.order('id DESC').limit(8)
    
    @orders = current_end_user.where(end_user_id :current_end_user)
  end
  
  

  def new
  	@order = Order.new
  	@shipping_address_new = ShippingAddress.new
  	@shipping_addresses = current_end_user.shipping_addresses
  end

  def confirm
    @order = Order.new
  	session[:payment_way] = params[:payment_way]
    @send_price = 800
    @toral_price = current_end_user.cart_total_price + @send_price
    @end_user_id = current_end_user.id

    if params[:select] == "select_address"
    @shipping_addresses = ShippingAddress.find(params[:address])
    @postal_code = @shipping_addresses.postal_code
    @address = @shipping_addresses.address
    @address_name = @shipping_addresses.address_name
    elsif params[:select] == "my_address"
      session[:address] ="〒" +current_end_user.postal_code+current_end_user.address+current_end_user.last_name+current_end_user.first_name
    @postal_code = current_end_user.postal_code
    @address = current_end_user.address
    @address_name = current_end_user.last_name+current_end_user.first_name

    else params[:select] == "new_address"
      session[:address] = params[:shipping_address]
    @postal_code = params[:shipping_address][:postal_code]
    @address = params[:shipping_address][:address]
    @address_name = params[:shipping_address][:address_name]
 
    end
    
    if session[:address].present? && session[:payment_way].present?
      redirect_to order_confirm_path
    else

      flash[:order_new] = "支払い方法または配送先を選択して下さい"
      redirect_to public_new_order_path
    end
  end

   #def confirm
  #	 @order = current_end_user.find(params[:payment_way])

  #end
  def show
    @order = current_end_user.orders.find(params[:id])
    @end_user = EndUser.find(params[:id])
    @shipping_address_new = ShippingAddress.new
  end
  
  def thank
  end

  def index
  end

  def show	
  end

  private
  def order_params
    params.require(:order).permit(:select, :payment_way, :postal_code, :address, :address_name)
  end
  def shipping_address_params
  	params.require(:shipping_address).permit(:postal_code, :address, :address_name)
  end

end