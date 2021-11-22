class Mower < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :title, presence: true, length: { in: 3..140 }
  validates :description, length: { maximum: 500 }
end
