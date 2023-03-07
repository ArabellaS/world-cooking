class RecipesController < ApplicationController

  def article_params
    params.require(:recipe).permit(:photo)
  end

  def show
  end
end
