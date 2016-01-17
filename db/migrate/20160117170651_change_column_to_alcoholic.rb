class ChangeColumnToAlcoholic < ActiveRecord::Migration
  def up
    change_column :alcoholics, :name, :text, null: false, limit: 100
    change_column :alcoholics, :item1, :text, null: false, limit: 100
    change_column :alcoholics, :item2, :text, null: false, limit: 100
    change_column :alcoholics, :item3, limit: 100
    change_column :alcoholics, :item4, limit: 100
    change_column :alcoholics, :item5, limit: 100
    change_column :alcoholics, :item6, limit: 100
  end
  def down
    change_column :alcoholics, :name, :text, null: false
    change_column :alcoholics, :item1, :text, null: false
    change_column :alcoholics, :item2, :text, null: false
    change_column :alcoholics, :item3
    change_column :alcoholics, :item4
    change_column :alcoholics, :item5
    change_column :alcoholics, :item6
  end
end
