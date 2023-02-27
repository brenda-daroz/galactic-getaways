class Spaceship < ApplicationRecord
  belongs_to :user # dependent: :destroy
  has_many :bookings

  # validates :name, uniqueness: true
  validates :description, length: { minimum: 10}

end
