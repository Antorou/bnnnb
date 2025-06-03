class BookingsController < ApplicationController
  before_action :set_room, only: [:new, :create]
  before_action :authenticate_user!

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.room = @room

    if @booking.save
      redirect_to @room, notice: "Room has been successfully booked!"
    else
        flash.now[:alert] = "Impossible de réserver la chambre. Veuillez vérifier les erreurs ci-dessous."
        render :new, status: :unprocessable_entity
    end
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
