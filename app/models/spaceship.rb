class Spaceship < ApplicationRecord
  # include SpaceshipModel::Model
  include ActiveStorageValidations
  include PgSearch::Model
  pg_search_scope :search_by_name_and_description,
    against: [ :name, :description ],
    using: {
      tsearch: { prefix: true }
    }

  belongs_to :user # dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many_attached :photos

  validates :name, :power, :speed, :seats, :price, presence: true
  validates :photos, attached: true, content_type: %i[png jpg jpeg]
  validates :description, length: { minimum: 10 }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
