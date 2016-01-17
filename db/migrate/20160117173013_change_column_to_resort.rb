class ChangeColumnToResort < ActiveRecord::Migration
  def up
    change_column :resorts, :name, :text, null: false, limit: 100
    change_column :resorts, :address, :text, limit: 200
    change_column :resorts, :detail, :text, null: false, limit: 1000
  end
  def down
    change_column :resorts, :name, :text, null: false
    change_column :resorts, :address, :text
    change_column :resorts, :detail, :text, null: false
  end
end
