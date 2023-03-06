class Quantity < ApplicationRecord
  belongs_to :ingredient
  belongs_to :recipe

  validates :amount, presence: true
  validates :unit, presence: true
end
