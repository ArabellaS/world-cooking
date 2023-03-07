class PlacesController < ApplicationController

  def index
    @places = Place.all
    @markers = @places.geocoded.map do |place|
      {
        lat: flat.lat,
        lng: flat.lng
        info_window_html: render_to_string(partial: "info_window", locals: {place: place})
        marker_html: render_to_string(partial: "marker")
      }
    end
end
