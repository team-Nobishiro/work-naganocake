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

  # def password_required?
  #   if do_validate # パスワード検証を行う条件
  #     !persisted? || !password.nil? || !password_confirmation.nil?
  #   else
  #     false
  #   end
  # end

  has_many :shipping_addresses 
end
