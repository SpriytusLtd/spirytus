class CreateDrinksUsers < ActiveRecord::Migration
  def change
    create_table :drinks_users , id: false do |t|
      t.references :drinks, index: true, null: false
      t.references :users, index: true, null: false
    end
  end
end
