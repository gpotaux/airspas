class Spa < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, length: { minimum: 2 }, presence: true, uniqueness: { scope: :address, message: "This spa already exists for this address" }
  validates :address, length: { minimum: 4 }, presence: true
  validates :category, inclusion: { in: %w(jacuzzi hammam sauna) }
  CATEGORIES = ["jacuzzi", "hammam", "sauna"]
end
