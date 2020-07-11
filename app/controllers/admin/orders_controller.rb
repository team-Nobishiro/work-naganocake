class Admin::OrdersController < ApplicationController
  def index   
    # @orders = Order.order('id DESC').limit(8)
    @orders = Order.all.page(params[:page]).per(10)
    @order_items = OrderItem.all
    @count = 0
  end
  
  def show
    @orders = current_end_user.orders 
    @order = Order.find(params[:id])
    @count = 0
  end
 def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to admin_order_path(order)
    else
      redirect_to admin_order_path(order)
    end
  end

  private
  def order_params
    params.require(:order).permit(:select)
  end
end
