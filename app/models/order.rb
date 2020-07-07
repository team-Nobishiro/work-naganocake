class Order < ApplicationRecord
  belongs_to :end_user
	has_many :order_items, dependent: :destroy

	def seikyu
		(end_user.cart_total_price + 800)
	end
  
end
