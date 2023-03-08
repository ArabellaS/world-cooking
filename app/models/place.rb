class Place < ApplicationRecord
  geocoded_by :address, latitude: :lat, longitude: :lng
  after_validation :geocode

  has_many :used_ins
  has_many :ingredients, through: :used_ins, source: :usable, source_type: 'Ingredient'
  has_many :utensils, through: :used_ins, source: :usable, source_type: 'Utensil'

  def address
    localisation = []
    localisation << city if city
    localisation << region if region
    localisation << country
    "#{localisation.join(",")}"
  end
end
