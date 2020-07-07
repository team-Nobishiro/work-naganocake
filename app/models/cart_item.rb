class CartItem < ApplicationRecord
  belongs_to :end_user
	belongs_to :item

	
   
   
   def subtotal_price
		(number * item.not_taxprice) 
	end

	
end
