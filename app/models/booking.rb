class Booking < ApplicationRecord
  belongs_to :mower
  belongs_to :user
end
