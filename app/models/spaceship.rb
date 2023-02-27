class Spaceship < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, uniqueness: true
  validates :user, :photo_url, presence: true
  validates :description, length: { minimum: 10}

end
