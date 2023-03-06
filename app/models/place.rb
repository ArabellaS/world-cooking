class Place < ApplicationRecord
  has_many :used_ins
  has_many :ingredients, through: :used_ins, source: :usable, source_type: 'Ingredient'
  has_many :utensils, through: :used_ins, source: :usable, source_type: 'Utensil'
end
