class Flat < ApplicationRecord
  has_many_attached :photos
  has_many :bookings
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :price, presence: true

end
