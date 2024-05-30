class Costume < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user

  validates :title, :description, :price_per_day, :size, :category, presence: true
  validates :description, length: { minimum: 6 }

  has_many_attached :photos
end
