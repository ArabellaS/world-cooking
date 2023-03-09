# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
p "Seeds in progress ..."
p "Can take 5 mins ..."

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

Scraper::RecipesByCountryService.call('France')
Scraper::RecipesByCountryService.call('Italy')
Scraper::RecipesByCountryService.call('India')

p "Seeds done."