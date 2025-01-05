class AddStatusToRestaurants < ActiveRecord::Migration[7.1]
  def change
    add_column :restaurants, :status, :string, default: 'suggested', null: false
  end
end
