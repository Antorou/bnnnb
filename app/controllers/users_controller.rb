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

  respond_to do |format|
    format.html # initial page
    format.turbo_stream { render partial: "bookings", locals: { current_bookings: @current_bookings, upcoming_bookings: @upcoming_bookings, past_bookings: @past_bookings, tab: params[:tab] } }
  end
end



end
