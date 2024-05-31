class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :costume

  validates :end_date, :start_date, presence: true
  validate :end_date_is_after_start_date
  validate :no_overlapping_booking

  private

  def end_date_is_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date

      errors.add(:end_date, "must be equal to or later than the start date")

    end
  end

  def no_overlapping_booking
    return if end_date.blank? || start_date.blank?

    overlapping_booking = Booking.where(costume_id: costume_id).where("start_date < ? AND end_date > ?", end_date, start_date).where.not(id: id)

    if overlapping_booking.exists?
      errors.add(:end_date, "Booking overlaps with an existing booking")
    end
  end
end
