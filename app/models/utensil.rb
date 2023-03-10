class Utensil < ApplicationRecord
  has_many :used_ins, as: :usable
  has_many :places, through: :used_ins

  validates :name, presence: true
end
