class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :end_user_id
      t.integer :select,default: "0"
      t.integer :toral_price
      t.integer :send_price
      t.integer :payment_way
      t.string :postal_code
      t.string :address
      t.string :address_name

      t.timestamps
    end
  end
end
