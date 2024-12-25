# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Resetting Blogs"
Blog.destroy_all
puts "Creating Faker Data"

10.times do |index|
  new_blog = Blog.create!(
    title: Faker::Book.title,
    content: Faker::Quote.mitch_hedberg,
    published_date: Date.today
  )
  puts "Created #{new_blog.title}"
end
puts "All blogs have been created."
