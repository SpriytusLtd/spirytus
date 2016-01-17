class ChangeColumnToStore < ActiveRecord::Migration
  def up
    change_column :stores, :name, :text, null: false, limit: 100
    change_column :stores, :address, :text, null: false, limit: 200
    change_column :stores, :phone_number, :string, null: false, default: "", limit: 20
    change_column :stores, :budget, :integer, limit: 10
    change_column :stores, :detail, :text, null: false, limit: 2000
  end
  def down
    change_column :stores, :name, :text, null: false
    change_column :stores, :address, :text, null: false
    change_column :stores, :phone_number, :string, null: false, default: ""
    change_column :stores, :budget, :integer
    change_column :stores, :detail, :text, null: false
  end
end
