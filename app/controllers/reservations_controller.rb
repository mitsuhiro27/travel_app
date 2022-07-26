class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @reservation = Reservation.new
  end

  def index
    @reservations = Reservation.all
    puts @price
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def confirm
    @reservation = Reservation.new(params.permit(:start_day, :end_day, :number, :reservation_price,  :room_id, :user_id))
    @room = Room.find(params[:room_id])
    @days = (@reservation.end_day - @reservation.start_day).to_i
    @price = @days * @room.price * @reservation.number
    reservation_price = @price

    if @days <= 0
      flash[:alert] = "終了日は開始日より後にしてください"
      redirect_to @room 
  
      elsif @reservation.number <=0 
        flash[:alert] = "正しい人数を入力してください"
        redirect_to @room
    end
  end
  
  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to '/reservations/index'
    else
      render ''
    end
  end
    
    private
      def reservation_params
      params.require(:reservation).permit(:start_day, :end_day, :room_id, :user_id, :number)
    end 
end
