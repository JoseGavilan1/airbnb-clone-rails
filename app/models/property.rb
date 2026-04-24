class Property < ApplicationRecord
  has_one_attached :photo
  belongs_to :user, optional: true
  has_many :bookings
  has_many :reviews, dependent: :destroy
end