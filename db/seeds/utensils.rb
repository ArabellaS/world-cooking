Utensil.destroy_all# if Rails.env.development?

p "Create utensils in France ..."
Scraper::UtensilsByCountryService.call('France')
p "Done"

p "Create utensils in Italy ..."
Scraper::UtensilsByCountryService.call('Italy')
p "Done"

p "Create utensils in India ..."
Scraper::UtensilsByCountryService.call('India')
p "Done"

p "Create utensils in Japan ..."
Scraper::UtensilsByCountryService.call('Japan')
p "Done"