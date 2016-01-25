class ChangeColumnToDrink < ActiveRecord::Migration
  def up
    change_column :drinks, :name, :text, null: false, limit: 100
    change_column :drinks, :alcohol, :integer, default: 0
    change_column :drinks, :detail, :text, limit: 1000
  end
  def down
    change_column :drinks, :name, :text, null: false
    change_column :drinks, :alcohol, :integer
    change_column :drinks, :detail, :text
  end
end
