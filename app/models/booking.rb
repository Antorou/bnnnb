class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :start_date, :end_date, presence: true
  
  validate :start_date_cannot_be_in_the_past
  validate :end_date_after_start_date
  validate :dates_do_not_overlap_existing_booking

  private

  def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "ne peut pas être avant aujourd'hui")
    end
  end

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date <= start_date
      errors.add(:end_date, "doit être après la date d'arrivée")
    end
  end

  def dates_do_not_overlap_existing_booking
    return if start_date.blank? || end_date.blank?

    overlapping_bookings = Booking.where(room_id: room_id)
      .where.not(id: id) # Exclure la réservation en cours si update
      .where("start_date < ? AND end_date > ?", end_date, start_date)

    if overlapping_bookings.exists?
      errors.add(:base, "Cette chambre est déjà réservée pendant ces dates")
    end
  end
end