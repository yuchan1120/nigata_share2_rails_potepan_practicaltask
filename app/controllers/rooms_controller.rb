class RoomsController < ApplicationController

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:name,:introduction,:price,:address,:image, :user_id))
    @room.user_id = current_user.id
        if @room.save
          redirect_to  "http://localhost:3000"
        else
          render "new"
        end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
