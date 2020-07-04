class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.text :introduction
      t.string :image_id
      t.integer :not_taxprice
      t.boolean :is_sale_status

      t.timestamps
    end
  end
end
