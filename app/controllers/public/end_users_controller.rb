class Public::EndUsersController < ApplicationController
  def show
    
  end

  def edit
    
  end
  
  def update
    
  end

  def withdrawal
    
  end

  def destroy
    
  end

  private
  def end_user_params
    params.require(:end_user).permit(:email, :last_name, :first_name, :last_name_kana,
                                     :first_name_kana, :phone_number, :postal_code, :address)
  end
end
