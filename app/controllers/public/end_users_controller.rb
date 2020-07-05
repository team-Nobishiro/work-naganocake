class Public::EndUsersController < ApplicationController
	before_action :authenticate_end_user!

	def index
	@end_users = EndUser.all
	@end_user = EndUser.where(end_user_id: current_end_user.id)
	
	 
	end

	def show
	@end_user = EndUser.where(end_user_id: current_end_user.id)

	end

	def edit
	@end_user = EndUser.where(end_user_id: current_end_user.id)

	end

	before_action :authenticate_end_user!

  def new
    @end_user = current_end_user.id
  end


	

    private
    def end_user_params
        params.require(:end_user).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :phone_number, :postal_code, :address)
    end


end
