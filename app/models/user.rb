class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recipes
  #, through: :feedbacks
  has_one :flavor_profile
  has_many :proposed_recipes

  validates_presence_of :name
end
