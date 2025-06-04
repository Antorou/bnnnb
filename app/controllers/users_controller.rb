class UsersController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @rooms = current_user.rooms
    @bookings = current_user.bookings.where('start_date >= ?', Date.today).order(:start_date)
  end
end
