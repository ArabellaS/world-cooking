class Recipe < ApplicationRecord
  belongs_to :place
  has_many :categories, through: :tags
  has_many :ingredients, through: :quantities
  has_one_attached :photo

  validates :content, presence: true
end
