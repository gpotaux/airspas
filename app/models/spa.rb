class Spa < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  has_many :reviews, through: :bookings
  validates :name, length: { minimum: 2 }, presence: true, uniqueness: { scope: :address, message: "This spa already exists for this address" }
  validates :address, length: { minimum: 4 }, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  validates :category, inclusion: { in: %w(jacuzzi hammam sauna) }
  CATEGORIES = ["jacuzzi", "hammam", "sauna"]

  def average_rating
    if reviews.count.positive?
      sum = 0
      reviews.each do |review|
        sum += review.rating
      end
      sum / reviews.count
    end
  end
end
