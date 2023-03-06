class Recipe < ApplicationRecord
  belongs_to :place
  has_many :categories, through: :tags
  has_many :ingredients, through: :quantities

  validates :content, presence: true
end
