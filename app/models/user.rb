class User < ApplicationRecord
  has_many :rooms
  has_many :bookings
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
