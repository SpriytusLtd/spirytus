class AddColumnToStore < ActiveRecord::Migration
  def change
    add_column :stores, :name, :text, null: false
    add_column :stores, :address, :text, null: false
    add_column :stores, :phone_number, :string, null: false, default: ""
    add_column :stores, :budget, :integer
    add_column :stores, :detail, :text, null: false
  end
end
