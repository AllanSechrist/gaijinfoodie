class AddRatingsToBlogs < ActiveRecord::Migration[7.1]
  def change
    add_column :blogs, :food_rating, :string
    add_column :blogs, :service_rating, :string
    add_column :blogs, :price_rating, :string

    reversible do |dir|
      dir.up do
        Blog.reset_column_information
        Blog.all.each do |blog|
          if blog.restaurant
            blog.update(
              food_rating: blog.restaurant.food_rating,
              service_rating: blog.restaurant.service_rating,
              price_rating: blog.restaurant.price_rating
            )
          end
        end
      end
    end
  end
end
