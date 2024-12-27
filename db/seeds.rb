# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Resetting DB"
Blog.destroy_all
Restaurant.destroy_all
puts "Creating Faker Data"
puts "Creating restaurant"

new_restaurant = Restaurant.create!(
  name: "Burger King",
  location: "123 Main St",
  cuisine: "Fast Food",
  website: "https://www.burgerking.com",
  phone: "123-456-7890",
  email: "8oT2X@example.com",
  food_rating: "4",
  service_rating: "3",
  price_rating: "2",
  open_time: "10:00",
  close_time: "22:00",
  days_open: "Mon-Fri"
)
puts "Created #{new_restaurant.name}"

10.times do |index|
  new_blog = Blog.create!(
    title: Faker::Book.title,
    content: Faker::Quote.mitch_hedberg,
    published_date: Date.today,
    restaurant: new_restaurant
  )
  puts "Created #{new_blog.title}"
end
puts "All blogs have been created."
