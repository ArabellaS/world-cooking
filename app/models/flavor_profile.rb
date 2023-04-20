class FlavorProfile < ApplicationRecord
  belongs_to :user

  validates_presence_of :saltiness, :sweetness, :savoriness, :sourness,
                         :spiciness, :bitterness, :fattiness
  validates_inclusion_of :saltiness, :sweetness, :savoriness, :sourness,
                         :spiciness, :bitterness, :fattiness, :in => 0..5
end
