class Flat < ApplicationRecord
  has_many_attached :photos
  has_many :bookings
  belongs_to :user
  has_many :reviews

  validates :title, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :price, presence: true
  validates :guests, presence: true
  validates :bedrooms, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
