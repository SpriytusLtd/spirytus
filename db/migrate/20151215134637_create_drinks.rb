class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.text :name, null: false
      t.integer :alcohol
      t.text :detail
      t.integer :alcoholic_id
      t.integer :brewer_id

      t.timestamps null: false
    end
  end
end
