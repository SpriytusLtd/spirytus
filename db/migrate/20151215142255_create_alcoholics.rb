class CreateAlcoholics < ActiveRecord::Migration
  def change
    create_table :alcoholics do |t|
      t.text :name, null: false
      t.text :item1, null: false
      t.text :item2, null: false
      t.text :item3
      t.text :item4
      t.text :item5
      t.text :item6

      t.timestamps null: false
    end
  end
end
