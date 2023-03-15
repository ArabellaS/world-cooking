class Category < ApplicationRecord
  has_many :tags
  has_many :recipes, through: :tags
end
