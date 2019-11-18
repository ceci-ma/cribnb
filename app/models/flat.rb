class Flat < ApplicationRecord
  has_many_attached :photos

  validates :title, pressence: true
  validates :description, pressence: true
  validates :location, pressence: true
  validates :price, pressence: true

end
