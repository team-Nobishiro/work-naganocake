class Public::HomesController < ApplicationController

  def top
  	@items = Item.all
  	@genres = Genre.all
  end

  def about
  	@end_users = EndUser.all
	@end_user = EndUser.new    
  end
  
end