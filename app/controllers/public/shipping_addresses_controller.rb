class Public::ShippingAddressesController < ApplicationController

  def index
  	@shipping_address_new = ShippingAddress.new
  end

  def edit
  end

end
