class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller? 

    protect_from_forgery with: :exception

    before_action :authenticate_user!

    before_action :set_q_for_room

    before_action :set_q, only: [:index, :search]

    def search
      @results = @q.result(distinct: true)
      if @q_header
        @results = @q_header.result(distinct: true)
      end
    end

    def set_q_for_room
      @q_header = Room.ransack(params[:q])
    end 

    private

    def set_q
      @q = Room.ransack(params[:q])
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,keys:[:name, :avater]) 
    end

    protected
    def configure_permitted_parameters
      # サインアップ時にnameのストロングパラメータを追加
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :avater])
      # アカウント編集の時にnameとprofileのストロングパラメータを追加
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile, :avater])
    end  

end
