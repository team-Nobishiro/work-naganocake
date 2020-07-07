class Public::CartItemsController < ApplicationController

 def index
   @cart_items = current_end_user.cart_items
   
   @cart_item = CartItem.new
 end

 def create
  @cart_item = CartItem.new(cart_item_params)
  @cart_item.end_user_id = current_end_user.id
    if @cart_item.save
      redirect_to public_cart_items_path
    end
 end
 def update
 	@cart_item = CartItem.find(params[:id])

 	@cart_item.update(cart_item_params)
 
 	redirect_to public_cart_items_path
 end

 def destroy
 	@cart_item = CartItem.find(params[:id])
  @cart_item.destroy
   redirect_to public_cart_items_path
 end

 def destroy_all
 	@cart_items = current_end_user.cart_items
  
 	@cart_items.destroy_all
 	 redirect_to public_cart_items_path
 end
 

 private
 def cart_item_params
   params.require(:cart_item).permit(:end_user_id, :item_id, :number)
 end

end
