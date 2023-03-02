class Spaceship < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,
    against: [ :name, :description ],
    using: {
      tsearch: { prefix: true }
    }

  belongs_to :user # dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many_attached :photos

  # validates :name, uniqueness: true
  validates :description, length: { minimum: 10 }

end
