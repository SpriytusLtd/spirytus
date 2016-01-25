class AddMunicipalityToStore < ActiveRecord::Migration
  def change
    add_column :stores, :municipality_id, :integer, null: false
  end
end
