class Feedback < ApplicationRecord
  belongs_to :recipe
  belongs_to :user

  validates :content, presence: true
end
