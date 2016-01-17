class ChangeColumnToDish < ActiveRecord::Migration
  def up
    change_column :dishes, :name, :text, null: false, limit: 100
    change_column :dishes, :local_dishes, :boolean, null: false, default: false
    change_column :dishes, :detail, :text, limit: 1000
  end
  def down
    change_column :dishes, :name, :text, null: false
    change_column :dishes, :local_dishes, :text, null: false
    change_column :dishes, :detail, :text
  end
end
