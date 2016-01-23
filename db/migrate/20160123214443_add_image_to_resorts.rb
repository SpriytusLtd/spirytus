class AddImageToResorts < ActiveRecord::Migration
  def change
    add_column :resorts, :image, :string
  end
end
