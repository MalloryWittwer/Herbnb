class Mower < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { in: 3..140 }
  validates :description, length: { maximum: 500 }
end
