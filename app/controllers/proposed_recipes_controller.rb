class ProposedRecipesController < ApplicationController
  def create
    @proposed_recipe = ProposedRecipe.new(recipe: Recipe.find(params[:recipe]), user: current_user)
    @proposed_recipe.save
    redirect_to recipe_path(params[:recipe])
  end
end
