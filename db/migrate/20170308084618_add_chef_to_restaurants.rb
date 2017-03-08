class AddChefToRestaurants < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :chef, :string
  end
end
