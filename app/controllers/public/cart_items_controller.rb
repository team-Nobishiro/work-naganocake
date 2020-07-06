class Public::CartItemsController < ApplicationController

 def index
   @cart_items = current_end_user.cart_items
   
   @cart_item = CartItem.new
 end

 def create
   @cart_item = CartItem.new(cart_item_params)
 if @cart_item.save
    redirect_to cart_items_path
   end
 end


 private
 def cart_item_params
   params.require(:cart_item).permit(:end_user_id, :item_id, :number)
 end

end
