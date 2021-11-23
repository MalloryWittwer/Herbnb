class Mower < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :title, presence: true, length: { in: 3..140 }
  validates :description, length: { maximum: 500 }
  validates :price_per_day, presence: true

  has_one_attached :photo
end
