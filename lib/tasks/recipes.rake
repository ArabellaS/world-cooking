namespace :recipes do
  desc "Enrich all recipes with ratings"
  task update: :environment do
    recipes = Recipe.all
    puts "Enqueuing update of #{recipes.size} recipes..."
    recipes.each do |recipe|
      UpgradeRecipeRatingsJob.perform_later(recipe)
    end
  end
end
