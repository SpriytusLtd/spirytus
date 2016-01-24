class CreateMunicipalities < ActiveRecord::Migration
  def change
    create_table :municipalities do |t|
      t.text :name, null: false

      t.timestamps null: false
    end
  end
end
