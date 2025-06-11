class Room < ApplicationRecord
    has_many :bookings
    has_many_attached :photos 

    belongs_to :user

    validates :price_per_night, :max_guests, :description, presence: true

    scope :search, ->(query) {
  where("name ILIKE :q OR description ILIKE :q", q: "%#{query}%") if query.present?
    }

    scope :sorted_by_price, ->(order = :asc) {
    order(price_per_night: order) if %i[asc desc].include?(order.to_sym)
    }

end


