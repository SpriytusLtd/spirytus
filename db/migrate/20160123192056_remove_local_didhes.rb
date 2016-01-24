class RemoveLocalDidhes < ActiveRecord::Migration
  def up
    remove_column :dishes, :local_dishes, :boolean, null: false, default: false
      end
  def down
    add_column :dishes, :local_dishes, :boolean, null: false, default: false
  end
end
