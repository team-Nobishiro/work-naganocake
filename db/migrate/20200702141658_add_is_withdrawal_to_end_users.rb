class AddIsWithdrawalToEndUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :end_users, :is_withdrawal, :boolean, default: false, null: false
  end
end
