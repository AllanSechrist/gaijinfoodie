class AddRestaurantToBlog < ActiveRecord::Migration[7.1]
  def change
    add_reference :blogs, :restaurant, null: false, foreign_key: true
  end
end
