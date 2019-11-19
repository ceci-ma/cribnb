class Flat < ApplicationRecord
  has_many_attached :photos

  validates :title, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :price, presence: true

end
