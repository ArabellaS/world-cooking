class Tag < ApplicationRecord
  belongs_to :recipe
  belongs_to :category
end
