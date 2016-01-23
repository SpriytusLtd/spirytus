class CreateStoresUsers < ActiveRecord::Migration
  def change
    # store users favorites
    create_table :stores_users, id: false do |t|
      t.references :store, index: true, null: false
      t.references :user, index: true, null: false
    end
  end
end
