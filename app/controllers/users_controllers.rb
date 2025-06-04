  def dashboard
    @my_rooms = current_user.rooms
    @my_bookings = current_user.bookings.includes(:room).order(start_date: :asc)
  end