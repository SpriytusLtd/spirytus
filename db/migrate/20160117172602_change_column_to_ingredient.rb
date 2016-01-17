class ChangeColumnToIngredient < ActiveRecord::Migration
  def up
    change_column :ingredients, :name, :text, null: false, limit: 100
  end
  def down
    change_column :ingredients, :name, :text, null: false
  end
end
