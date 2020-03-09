class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :detail, null: false
      t.integer :shipping_date, null: false
      t.integer :price, null: false
      t.integer :which_postage, null: false
      t.integer :delivery_status, null: false
      t.integer :prefecture, null: false
      # t.references :brand , foreign_key:true
      # t.references :category, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      # t.references :size, foreign_key: true
      # t.references :condition, null: false, foreign_key: true
      # t.references :sending_method, null: false, foreign_key: true
      # t.references :buyer, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
