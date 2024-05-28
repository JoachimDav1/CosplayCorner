class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :costume
  validates :end_date, :start_date, presence: true
end
