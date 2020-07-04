class Public::EndUsersController < ApplicationController
  before_action :authenticate_end_user!
  
  def show
    @end_user = current_end_user
  end

  def edit
    # @end_user = EndUser.find(params[:id])
    # 	if @end_user != current_user
    #     	redirect_to root_path
    # 	end
  end
  
  def update
    @end_user = EndUser.find(params[:id])
		if @end_user.update(end_user_params)
			redirect_to public_end_users_path(@end_user.id), notice: 'successfully updated'
		else
			render action: :edit
		end
  end

  def withdrawal
    # @end_user = EndUser.find(params[:id])
  end

  def destroy
    @end_user = EndUser.find(params[:id])
		@end_user.destroy
		redirect_to root_path
  end

  def hide
    @end_user = EndUser.find(params[:id])
    @end_user.update(is_withdrawal: true)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  private
  def end_user_params
    params.require(:end_user).permit(:email, :last_name, :first_name, :last_name_kana,
                                     :first_name_kana, :phone_number, :postal_code, :address, :is_withdrawal)
  end
end
