# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Seeding database..."

# Create an admin user
admin_user = User.create!(
    username: "admin", 
    first_name: "Admin",
    last_name: "User",
    email: "admin@example.com",
    password: "password",
    password_confirmation: "password"
    )

puts "Admin user created with email: #{admin_user.email} and password: #{admin_user.password}"
# Create a sample task for the admin user   
first_task = Task.create!(
    title: "Sample Task",
    description: "This is a sample task created during seeding.",
    priority: "high",
    due_date: Date.today + 7.days,
    completed: false,
    user: admin_user
)
