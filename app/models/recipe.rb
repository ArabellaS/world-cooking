class Recipe < ApplicationRecord
  belongs_to :place
  has_many :categories, through: :tags
  has_many :ingredients, through: :quantities
  has_one_attached :photo
  validates :content, presence: true

  include PgSearch::Model
  pg_search_scope :global_search,
                  against: [:name],
                  associated_against: {
                    categories: [:content],
                    place: %i[country city region]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
