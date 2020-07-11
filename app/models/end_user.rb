class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :shipping_addresses, :dependent => :destroy
  has_many :cart_items, :dependent => :destroy
  has_many :orders, :dependent => :destroy     
  
  
  def active_for_authentication?
    super && (self.is_withdrawal == false)
  end
  def cart_total_price
    cart_items.joins(:item).sum("cart_items.number * items.not_taxprice")
  end

  has_many :shipping_addresses 

end