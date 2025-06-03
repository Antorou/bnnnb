class RoomsController < ApplicationController
    before_action :set_room, only: [:show, :edit, :update, :destroy]

    before_action :authorize_user!, only: [:edit, :update, :destroy]

    def index
        @rooms = Room.all
    end

    def show
    end

    def new
    @room = Room.new
    end

    def create
        @room = Room.new(room_params)
        @room.user = current_user
        if @room.save
            redirect_to @room, notice: "Room created with success"
        else
            render :new
        end
    end

  def edit
  end

  def update
    if @room.update(room_params)
      redirect_to @room, notice: "Room modified"
    else
      render :edit
    end
  end

  def destroy
    @room = Room.find(params[:id])
    if @room.bookings.exists?
        redirect_to @room, alert: "Impossible de supprimer cette chambre car elle a des réservations actives."
    else
        @room.destroy
        redirect_to rooms_path, notice: "La chambre a bien été supprimée."
    end
  end

  private

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:name, :description, :price_per_night, :max_guests)
  end

  def authorize_user!
    unless @room.user == current_user
        redirect_to rooms_path, alert: "Tu n'es pas autorisé à modifier cette chambre."
    end
  end
end
