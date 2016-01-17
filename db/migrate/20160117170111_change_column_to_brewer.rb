class ChangeColumnToBrewer < ActiveRecord::Migration
  def up
    change_column :brewers, :name, :text, null: false, limit: 100
  end
  def down
    change_column :brewers, :name, :text, null: false
  end
end
