# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
p "Seeds in progress ..."
p "Can take more than 10 mins ..."

p "Create places ..."
Place.create(country: "India")
Place.create(country: "Canada")
Place.create(country: "Japan")
Place.create(country: "Chile")
Place.create(country: "Australia")
Place.create(country: "India", region: "Goa", city: "Panaji")
Place.create(country: "France", city: "Paris")
Place.create(country: "France", city: "Toulouse")
Place.create(country: "Italy", city: "Palermo")
Place.create(country: "Italy", city: "Rome")

p "Create recipes in France ..."
Scraper::RecipesByCountryService.call('France')

p "Create recipes in Italy ..."
Scraper::RecipesByCountryService.call('Italy')

p "Create recipes in India ..."
Scraper::RecipesByCountryService.call('India')

p "Create recipes in Japan ..."
Scraper::RecipesByCountryService.call('Japan')

p "Create places for all recipes ..."
Recipe.all.each do |recipe|
  Scraper::RecipesByPlaceService.call(recipe)
end

p "Seeds done."