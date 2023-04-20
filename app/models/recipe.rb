class Recipe < ApplicationRecord
  belongs_to :place, optional: true

  has_many :quantities
  has_many :ingredients, through: :quantities
  has_one_attached :photo, dependent: :purge
  validates :content, presence: true

  include PgSearch::Model
  pg_search_scope :global_search,
                  against: [:name],
                  associated_against: {
                    place: %i[country city region]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }

  def has_ratings?
    recipe.fattiness
  end
end
