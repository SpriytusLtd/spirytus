class CreateResorts < ActiveRecord::Migration
  def change
    create_table :resorts do |t|
      t.text :name, null: false
      t.text :address
      t.text :detail, null: false

      t.timestamps null: false
    end
  end
end
