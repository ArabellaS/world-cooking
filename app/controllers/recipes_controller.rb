class RecipesController < ApplicationController
  def show
    @ingredients = Ingredient.new
  end
end
