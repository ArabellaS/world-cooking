class RecipesController < ApplicationController
  def index
  end

  def show
    @ingredients = Ingredient.new

    @recipe = Recipe.find(params[:id])
  end
end
