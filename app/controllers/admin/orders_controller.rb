class Admin::OrdersController < ApplicationController
  def index   
    # @orders = Order.order('id DESC').limit(8)
    @orders = Order.all.page(params[:page]).per(10)
    @order_items = OrderItem.all
  end
  
  def show
    @orders = current_end_user.orders 
    @order = Order.find(params[:id])
  end
 def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to "/"
    else
      redirect_to admin_order_path(order)
    end
  end

  private
  def order_params
    params.require(:order).permit(:end_user_id, :select, :toral_price, :send_price,
                                  :payment_way, :postal_code, :address, :address_name)
  end
end
