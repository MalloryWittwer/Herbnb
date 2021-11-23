class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :mowers, dependent: :destroy
  has_many :bookings, dependent: :destroy
  validates :user_name, presence: true, length: { maximum: 50 }
  validates :address, presence: true, length: { maximum: 140 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
