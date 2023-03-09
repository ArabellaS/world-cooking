class RecipesController < ApplicationController
  def show
<<<<<<< HEAD
=======
    @ingredients = Ingredient.new

>>>>>>> origin
    @recipe = Recipe.find(params[:id])
  end
end
