class Order < ApplicationRecord
  belongs_to :end_user
	has_many :order_items, dependent: :destroy
  
end
