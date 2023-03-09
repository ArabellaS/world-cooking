class PlacesController < ApplicationController

  def index
    @places = Place.all
    @markers = @places.geocoded.map do |place|
      {
        lat: place.latitude,
        lng: place.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {place: place})
        marker_html: render_to_string(partial: "marker")
      }
    raise
    end
end
