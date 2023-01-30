class RoomsController < ApplicationController
  def index
    @rooms = Room.all
    @new_room = Room.new
  end

  def show
    @room = Room.find_by!(id: params[:id])
    @messages = @room.messages.includes(:user)
    @new_message = current_user&.messages&.build(room: @room)
  end

  def create
    @room = current_user.rooms.build(room_params)

    if @room.save
      redirect_to room_path(@room)
    end
  end

  private

  def room_params
    params.require(:room).permit(:title)
  end
end