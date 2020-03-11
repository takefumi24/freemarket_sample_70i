class CreateSendingMethods < ActiveRecord::Migration[5.2]
  def change
    create_table :sending_methods do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
