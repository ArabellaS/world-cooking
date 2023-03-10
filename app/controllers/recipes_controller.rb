class RecipesController < ApplicationController
  def show
    @ingredients = Ingredient.new

    @recipe = Recipe.find(params[:id])
  end
end
