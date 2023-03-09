Utensil.destroy_all# if Rails.env.development?

Utensil.create!(
  name: "name"
)

p "Create utensils in France ..."
Scraper::UtensilsByCountryService.call('France')