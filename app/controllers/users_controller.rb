class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = User.find_by(id: params[:id])
  end
end


