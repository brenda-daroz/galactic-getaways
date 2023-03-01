class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :spaceship

  validates :spaceship, :user, presence: true
  # start and end date overlap?
end
