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
          redirect_to  "http://localhost:3000/rooms/#{@room.id}"
        else
          render "new"
        end
  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      redirect_to "http://localhost:3000/users/show"
    else
      render "edit"
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to "http://localhost:3000/users/show"
  end

  def search
    if params[:keyword].present?
      @rooms = Room.where(["address like? OR name like? OR introduction like?","%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%"])
    elsif params[:area].present?
      @rooms = Room.where(["address like?","%#{params[:area]}%"])
    end
    render "index"
  end

  private

  def room_params
    params.require(:room).permit(:name, :introduction, :price, :address, :image, :user_id)
  end
end
