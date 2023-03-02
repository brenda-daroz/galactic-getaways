class Spaceship < ApplicationRecord

  belongs_to :user # dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many_attached :photos

  # validates :name, uniqueness: true
  validates :description, length: { minimum: 10 }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
