class RemoveRatingsFromRestaurants < ActiveRecord::Migration[7.1]
  def change
    remove_column :restaurants, :food_rating, :string
    remove_column :restaurants, :service_rating, :string
    remove_column :restaurants, :price_rating, :string
  end
end
