class Costume < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user

  validates :title, :description, :details, :price_per_day, :size, :category, presence: true
  validates :description, length: { minimum: 6 }

  has_many_attached :photos

  include PgSearch::Model
    pg_search_scope :search_by_title_and_description_and_category,
      against: [ :title, :description, :category ],
      using: {
        tsearch: { prefix: true } # <-- now `superman batm` will return something!
      }
end
