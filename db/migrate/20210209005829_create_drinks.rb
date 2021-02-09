class CreateDrinks < ActiveRecord::Migration[6.1]
  def change
    create_table :drinks do |t|
      t.string :name
      t.integer :quantity
      t.string :category
      t.integer :client_id

      t.timestamps null: false
    end
  end
end
