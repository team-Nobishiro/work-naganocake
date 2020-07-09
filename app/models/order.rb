class Order < ApplicationRecord
  belongs_to :end_user
  has_many :order_items, dependent: :destroy
  has_many :items, through: :order_items

	def seikyu
		(end_user.cart_total_price + 800)
  end
  
  enum payment_way:{
    "クレジットカード": 0,
    "銀行振込": 1
  }
  

  enum select:{
    "入金待ち": 0,
    "入金確認": 1,
    "制作中": 2,
    "発送準備中": 3,
    "発送済": 4
  }

  def sub_total_price
    (order_item.number * order_item.tax_price)
  end
end