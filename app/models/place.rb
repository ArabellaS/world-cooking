class Place < ApplicationRecord
  geocoded_by :address, latitude: :lat, longitude: :lng
  after_validation :geocode

  has_many :recipes, dependent: :destroy
  has_many :used_ins
  has_many :ingredients, through: :used_ins, source: :usable, source_type: 'Ingredient'
  has_many :utensils, through: :used_ins, source: :usable, source_type: 'Utensil'

  validates :country, presence: true

  def address
    localisation = []
    localisation << city if city
    localisation << region if region
    localisation << country
    "#{localisation.join(", ")}"
  end

  def self.collection
    places = Place.order(:country)
    places.map do |place|
      [place.address, place.id]
    end
  end
end
