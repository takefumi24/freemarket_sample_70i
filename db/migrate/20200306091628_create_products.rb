class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :detail, null: false
      t.integer :shipping_date, null: false
      t.integer :price, null: false
      t.integer :which_postage, null: false
      t.integer :delivery_status, null: false, default: 0
      t.integer :prefecture, null: false
      t.timestamps
    end
  end
end
