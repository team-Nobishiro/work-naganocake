class Admin::EndUsersController < ApplicationController

	def index
		@end_users = EndUser.all
	end

	def show
		@end_user = EndUser.find(params[:id])
	end

	def edit
		@end_user = EndUser.find(params[:id])
	end

  def update
  	@end_user = EndUser.find(params[:id])
    if @end_user.update(end_user_params)
      redirect_to admin_end_user_path
    else
      redirect_to edit_admin_end_user_path(@end_user)
    end
  end

	private
	def end_user_params
			params.require(:end_user).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :phone_number, :postal_code, :address)
	end

end
