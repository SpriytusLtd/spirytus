class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :text, null: false, limit: 20
    add_column :users, :thumbnail, :string
  end
end
