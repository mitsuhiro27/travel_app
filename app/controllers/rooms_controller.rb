class RoomsController < ApplicationController
  
  
    def index
        @rooms = current_user.rooms.all
        
    end    

    def new
        @room = Room.new
        
    end    

    def create
        @room = Room.new(room_params) 
        @room.user_id = current_user.id
        if @room.save #データをデータベースに保存するためのsaveメソッド実行
          redirect_to rooms_path
        else
          render'new' 
        end  

    end
    
    def show
        @room =Room.find(params[:id])
        @user = @room.user
        
    end    
    
   

      private

      

      def room_params #ストロングパラメータ
        params.require(:room).permit(:room_name, :room_profile, :price, :address, :room_image, :created_at) #パラメーターのキー
      end

 end      
