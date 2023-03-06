class Utensil < ApplicationRecord
  has_many :used_ins, as: :usable
end
