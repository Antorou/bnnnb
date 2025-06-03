class Room < ApplicationRecord
    has_many :bookings

    validates :price_per_night, :max_guests, :description, presence: true
end
