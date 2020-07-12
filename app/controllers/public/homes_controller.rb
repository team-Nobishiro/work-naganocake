class Public::HomesController < ApplicationController

  def top
    @items = Item.all
    @genres = Genre.all.where(is_valid: true)
  end

  def about
  	@end_users = EndUser.all
	  @end_user = EndUser.new    
  end
  
end