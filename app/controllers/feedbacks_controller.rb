class FeedbacksController < ApplicationController

  def new
    @feedback =  Feedback.new
  end

  def create
    @flavor_profile = FlavorProfile.find_by(user: current_user.id)
    @recipe = current_user.proposed_recipes.last.recipe_choosed_id
    @feedback = Feedback.create(content: params[:feedback][:content], user: current_user, recipe: @recipe)
    if @feedback.content == "Yes" || @feedback.content == "yes"
      Comparison::ComparingRecipeToFlavorProfile(@flavor_profile, @recipe)
    end
  end
end
