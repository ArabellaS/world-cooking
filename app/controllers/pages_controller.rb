class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @place = Place.new
    if params[:query].present?
      sql_query = <<~SQL
        recipes.title @@ :query
        OR recipes.name @@ :query
        OR recipes.category @@ :query
        OR recipes.place @@ :query
      SQL
      @recipes = Recipe.joins(:category, :place).where(sql_query, query: "%#{params[:query]}%")
    else
      @recipes = Recipe.all
    end
    @places = Place.all
    @markers = @places.geocoded.map do |place|
      {
        lat: place.lat,
        lng: place.lng,
        # info_window_html: render_to_string(partial: "info_window", locals: {place: place}),
        marker_html: render_to_string(partial: "marker")
      }
    end
  end
end
