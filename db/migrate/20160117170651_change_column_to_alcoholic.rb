class ChangeColumnToAlcoholic < ActiveRecord::Migration
  def up
    change_column :alcoholics, :name, :text, null: false, limit: 100
    change_column :alcoholics, :item1, :text, null: false, limit: 100
    change_column :alcoholics, :item2, :text, null: false, limit: 100
    change_column :alcoholics, :item3, :text, limit: 100
    change_column :alcoholics, :item4, :text, limit: 100
    change_column :alcoholics, :item5, :text, limit: 100
    change_column :alcoholics, :item6, :text, limit: 100
  end
  def down
    change_column :alcoholics, :name, :text, null: false
    change_column :alcoholics, :item1, :text, null: false
    change_column :alcoholics, :item2, :text, null: false
    change_column :alcoholics, :item3, :text
    change_column :alcoholics, :item4, :text
    change_column :alcoholics, :item5, :text
    change_column :alcoholics, :item6, :text
  end
end
