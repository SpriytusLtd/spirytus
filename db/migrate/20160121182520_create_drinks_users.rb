class CreateDrinksUsers < ActiveRecord::Migration
  def change
    create_table :drinks_users , id: false do |t|
      t.references :drink, index: true, null: false
      t.references :user, index: true, null: false
    end
  end
end
