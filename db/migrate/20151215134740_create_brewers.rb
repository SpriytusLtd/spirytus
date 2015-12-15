class CreateBrewers < ActiveRecord::Migration
  def change
    create_table :brewers do |t|
      t.text :name, null: false

      t.timestamps null: false
    end
  end
end
