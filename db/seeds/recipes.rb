Quantity.destroy_all# if Rails.env.development?
Recipe.destroy_all# if Rails.env.development?
Utensil.destroy_all# if Rails.env.development?
Place.destroy_all# if Rails.env.development?


Place.create!(
  city: "Toulouse",
  region: "Occitanie",
  country: "France"
)

Recipe.create!(
  content: "Content, content...",
  place: Place.first
)

Quantity.create!(
  amount: 12,
  unit: "kg",
  ingredient: Ingredient.first,
  recipe: Recipe.first
)

# file_1 = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Airbus_A220-300.jpg/1024px-Airbus_A220-300.jpg")
# plane_1.photo.attach(io: file_1, filename: "#{plane_1.name}_photo", content_type: 'image/*')

(1..3).each do |i|

  ingredient_random = Ingredient.all.sample
  recipe_endpoint = "https://api.spoonacular.com/recipes/findByIngredients?ingredients=#{ingredient_random.name}&number=2&apiKey=#{ENV['SPOONACULAR_API_KEY']}"

  serialized_data = URI.parse(recipe_endpoint).open.read
  results = JSON.parse(serialized_data)

  results.each do |result|

    ####### Recipes #######
    recipe = Recipe.create!(
      content: result["title"],
      place: Place.first
    )

    ####### Quantities #######
    if result["usedIngredientCount"] > 0
      p result["usedIngredientCount"]
      (0..(result["usedIngredientCount"]-1)).each do |n|
        next if result["usedIngredients"][n]["amount"] != nil || result["usedIngredients"][n]["original"] != nil
        Quantity.create!(
          amount: result["usedIngredients"][n]["amount"],
          unit: result["usedIngredients"][n]["original"],
          ingredient: ingredient_random,
          recipe: recipe
        )
      end
    end

    ####### Utensils #######
    if i < 4 #=> in 3 Recipes
      equipment_endpoint = "https://api.spoonacular.com/recipes/#{result["id"]}/equipmentWidget.json?apiKey=#{ENV['SPOONACULAR_API_KEY']}"
      serialized_data_equipment = URI.parse(equipment_endpoint).open.read
      results_equipment = JSON.parse(serialized_data_equipment)["equipment"]

      results_equipment.each do |result|
        next if Utensil.where(name: result["name"]).exists?
        Utensil.create!(
          name: result["name"]
        )
      end
    end

  end
end
