class Review < ApplicationRecord
  belongs_to :spa
  validates :rating, presence: true
end
