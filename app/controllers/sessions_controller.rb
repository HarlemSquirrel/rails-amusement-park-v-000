class SessionsController < ApplicationController
  def index
  end

  def new
  end

  def create
    session[:user_id] = User.find(user_params[:id]).id
    redirect_to user_path(current_user)
  end

  def destroy
    session.clear
    redirect_to root_url
  end

  private

  def user_params
    params.require(:user).permit(:id)
  end
end
