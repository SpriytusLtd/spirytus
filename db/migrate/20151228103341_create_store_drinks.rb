class CreateStoreDrinks < ActiveRecord::Migration
  def change
    create_table :store_drinks do |t|

      t.timestamps null: false
    end
  end
end
