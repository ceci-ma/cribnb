class User < ApplicationRecord
  has_many :bookings
  has_one_attached :avatar

  # has_many :flats, through: :bookings
  has_many :flats
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
