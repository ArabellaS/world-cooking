class UsedIn < ApplicationRecord
  belongs_to :place
  belongs_to :usable, polymorphic: true
end
