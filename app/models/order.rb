class Order < ApplicationRecord
  belongs_to :end_user
	has_many :order_items, dependent: :destroy
  

  enum select:{
    "入金待ち": 0,
    "入金確認": 1,
    "制作中": 2,
    "発送準備中": 3,
    "発送済": 4
  }
end