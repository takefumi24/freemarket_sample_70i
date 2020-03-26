class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :destination_family_name, :string, null: false, after: :name_kana
    add_column :users, :destination_name, :string, null: false, after: :destination_family_name
    add_column :users, :destination_family_name_kana, :string, null: false, after: :destination_name
    add_column :users, :destination_name_kana, :string, null: false, after: :destination_family_name_kana
  end
end