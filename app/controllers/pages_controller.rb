class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if params[:query].present?
      @recipes = Recipe.global_search(params[:query])
      @places = Place.where(id: @recipes.map(&:place).uniq!.map(&:id))
    else
      @recipes = Recipe.all
      @places = Place.all
    end
    @markers = @places.geocoded.map do |place|
      {
        lat: place.lat,
        lng: place.lng,
        info_window_html: render_to_string(partial: "card", locals: {place: place, ingredients: place.ingredients, utensils: place.utensils}),
        marker_html: render_to_string(partial: "marker", locals: {place: place, ingredients: place.ingredients, utensils: place.utensils})
      }
    end
  end

  def profile
    @flavor_profile = current_user.flavor_profile
  end
end
