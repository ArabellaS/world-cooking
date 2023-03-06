class Ingredient < ApplicationRecord
  has_many :used_ins, as: :usable

  validates :name, presence: true
end
