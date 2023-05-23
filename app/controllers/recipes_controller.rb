class RecipesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_resource, only: [:edit, :destroy]

  def index
    @recipies = Recipe.all
  end

  def new
    @recipe = Recipe.new
    #@recipe.user = current_user
  end

  def show
    @ingredients = Ingredient.new
    @recipe = Recipe.find(params[:id])
  end

  def create
    @recipe = Recipe.new(recipe_params)
    #@recipe.user = current_user
    if @recipe.save!
      redirect_to home_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to home_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :content, :saltiness, :sourness, :savoriness, :sweetness, :bitterness, :spiciness, :fattiness, :user_id)
  end
end
