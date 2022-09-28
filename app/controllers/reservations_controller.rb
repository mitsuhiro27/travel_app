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
    @reservation.end_day.nil?
    @reservation.end_day ||= "2022-1-1" 
    @reservation.start_day.nil?
    @reservation.start_day ||= "2022-12-31" 
    @days = (@reservation.end_day - @reservation.start_day).to_i
    @price = @days * @room.price * @reservation.number.to_i
    reservation_price = @price
     
    if @days <= 0
      flash[:alert] = "開始日または終了日を正しく入力してください"
      redirect_to @room 

    elsif @reservation.number.blank?
      flash[:alert] = "人数を入力してください"  
      redirect_to @room

    elsif @reservation.number <= 0 
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
