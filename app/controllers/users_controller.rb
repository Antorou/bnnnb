class UsersController < ApplicationController
  before_action :authenticate_user!


  def dashboard
    @rooms = current_user.rooms
    
    @current_bookings = current_user.bookings
      .where('start_date <= ? AND end_date >= ?', Date.today, Date.today)
      .order(:start_date)
    
    @upcoming_bookings = current_user.bookings
      .where('start_date > ?', Date.today)
      .order(:start_date)
    
    @past_bookings = current_user.bookings
      .where('end_date < ?', Date.today)
      .order(start_date: :desc)
  end


end
