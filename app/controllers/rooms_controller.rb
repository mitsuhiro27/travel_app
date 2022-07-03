class RoomsController < ApplicationController

    def index
        @rooms = Room.all
    end    

    def new
        @room = Room.new
        
    end    

    def create
        @room = Room.new(params.require(:room).permit(:room_name, :room_image, :room_profile, :price, :address, :created_at)) 
        @room.save #データをデータベースに保存するためのsaveメソッド実行
        redirect_to rooms_path
    end

    

    def show
        @room =Room.find(params[:id])
    end    

   

      
      private
        def room_params #ストロングパラメータ
          params.require(:room).permit(:room_name, :room_profile, :price, :address, :room_image) #パラメーターのキー
        end

 end      
