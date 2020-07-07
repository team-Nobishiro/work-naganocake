class Admin::OrderItemsController < ApplicationController
  def update
    @order = Order.find(params[:id])
    @order_item = OrderItem.find(params[:id])
    @order_item.update
    redirect_to admin_order_path(@order)
  end

  private
  def order_item_params
    params.require(:order_item).permit(:order_id, :item_id, :number, :tax_price, :production)
  end
end