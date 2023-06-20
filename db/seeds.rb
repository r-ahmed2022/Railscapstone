# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'factory_bot'
FactoryBot.find_definitions

exit if !Rails.env.development?
  
  p "Deleting data"
  Recipe.delete_all
  User.delete_all


  p "Creating user"
  user = FactoryBot.create(:user, email: 'riysaim@gmail.com')

  p "Creating Recipes"
  5.times do
    FactoryBot.create(:recipe, user: user)
  end

