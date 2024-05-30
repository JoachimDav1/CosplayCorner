class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :costume

  validates :end_date, :start_date, presence: true
  validate :end_date_is_after_start_date

  private

  def end_date_is_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be equal to or later than the start date")
    end
  end
end
