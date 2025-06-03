class Room < ApplicationRecord
    has_many :bookings

    belongs_to :user

    validates :price_per_night, :max_guests, :description, presence: true
end
