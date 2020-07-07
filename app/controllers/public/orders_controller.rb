class Public::OrdersController < ApplicationController
  def index
    # @orders = Order.order('id DESC').limit(8)
    @end_user = current_end_user
    @orders = current_end_user.orders
  end
  
  def show
    @order = Order.find(params[:id])
    @end_user = EndUser.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:end_user_id, :select, :toral_price, :send_price,
                                  :payment_way, :postal_code, :address, :address_name)
  end
end
