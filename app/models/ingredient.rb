class Ingredient < ApplicationRecord
  has_many :used_ins, as: :usable
  has_many :places, through: :used_ins

  validates :name, presence: true


  def self.collection
  ingredients = Ingredient.order(:name).pluck(:name, :id)
  end
end
