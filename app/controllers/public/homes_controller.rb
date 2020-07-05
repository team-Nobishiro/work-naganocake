class Public::HomesController < ApplicationController

  def top
  end

  def about
  	@end_users = EndUser.all
	 @end_user = EndUser.new
    
  end
  
end
