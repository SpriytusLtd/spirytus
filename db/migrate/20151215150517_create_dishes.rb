class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.text :name, null: false
      t.boolean :local_dishes, null: false
      t.text :detail

      t.timestamps null: false
    end
  end
end
