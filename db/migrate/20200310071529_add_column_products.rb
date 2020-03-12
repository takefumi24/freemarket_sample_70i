class AddColumnProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :brand, foreign_key:true
    add_reference :products, :user, null: false, foreign_key: true
    add_reference :products, :size, foreign_key:true
    add_reference :products, :condition, null: false, foreign_key: true
    add_reference :products, :sending_method, null: false, foreign_key: true
    add_reference :products, :buyer, foreign_key: { to_table: :users }
  end
end
