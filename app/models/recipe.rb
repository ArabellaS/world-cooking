class Recipe < ApplicationRecord
  belongs_to :place, optional: true

  has_many :quantities, dependent: :destroy
  has_many :ingredients, through: :quantities
  has_one_attached :photo, dependent: :purge

  accepts_nested_attributes_for :quantities

  validates_presence_of :content, :name
  validates_presence_of :saltiness, :sweetness, :savoriness, :sourness,
                         :spiciness, :bitterness, :fattiness
  validates_inclusion_of :saltiness, :sweetness, :savoriness, :sourness,
                        :spiciness, :bitterness, :fattiness, :in => 0..5

  include PgSearch::Model
  pg_search_scope :global_search,
                  against: [:name],
                  associated_against: {
                    place: %i[country city region]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }

end
