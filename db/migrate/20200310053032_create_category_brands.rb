class CreateCategoryBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :category_brands do |t|
      t.references :brand, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.timestamps
    end
  end
end
