# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Product.count == 0
  puts "Creating pixel product"
  Product.create! id: 1, name: 'Single Pixel', price: 1.00, active: true, item_purchased: 0, money_collected: 0, in_stock: 9999, money_goal: 10000, from_date: Time.now.to_date, to_date: Time.now.to_date + 1.month
end

if OrderStatus.count == 0
  puts "Creating order statuses"
  OrderStatus.create! id: 1, name: 'In Progress'
  OrderStatus.create! id: 2, name: 'Placed'
  OrderStatus.create! id: 3, name: 'Cancelled'
end

if AdminUser.count == 0
  puts "Creating admin user"
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
end
