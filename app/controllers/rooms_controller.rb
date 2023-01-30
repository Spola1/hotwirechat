class RoomsController < ApplicationController
  def index
  end

  def new
    @room = Room.new
  end

  def create
    @room = current_user.rooms.build(room_params)

    if @room.save
      flash[:success] = 'Room created!'
      redirect_to(root_path)
    else
      render(:new)
    end
  end

  private

  def room_params
    params.require(:room).permit(:title)
  end
end