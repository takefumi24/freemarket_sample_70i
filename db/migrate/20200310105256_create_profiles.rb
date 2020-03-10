class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :family_name, null: false
      t.string :name, null: false
      t.string :family_name_kana, null: false
      t.string :name_kana, null: false
      t.integer :prefecture, null: false
      t.string :city, null: false
      t.string :street, null: false
      t.string :building, null: false
      t.text :image
      t.text :introduction
      t.integer :postal_code, null: false
      t.integer :phone
      t.integer :birth_year, null: false
      t.integer :birth_month, null: false
      t.integer :birth_day, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
