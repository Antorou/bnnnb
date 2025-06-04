class Room < ApplicationRecord
    has_many :bookings
    has_many_attached :photos 

    belongs_to :user

    validates :price_per_night, :max_guests, :description, presence: true
end
