class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.datetime :expiration_date
      t.string :brand
      t.integer :quantity
      t.float :weight
      t.references :category, index: true

      t.timestamps null: false
    end
    add_foreign_key :foods, :categories
  end
end
