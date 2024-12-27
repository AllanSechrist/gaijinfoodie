class CreateRestaurants < ActiveRecord::Migration[7.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :location
      t.string :cuisine
      t.string :website
      t.string :phone
      t.string :email
      t.string :food_rating
      t.string :service_rating
      t.string :price_rating
      t.string :open_time
      t.string :close_time
      t.string :days_open

      t.timestamps
    end
  end
end
