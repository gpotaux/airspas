class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :spa
  has_one :review
  validates :start_date, :end_date, presence: true
  validate :booking_dates_verify

  private

  def booking_dates_verify
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end
end
