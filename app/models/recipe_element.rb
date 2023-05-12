class RecipeElement < ApplicationRecord
  belongs_to :ingredient
  belongs_to :recipe

  validates :amount, :unit, presence: true
end
