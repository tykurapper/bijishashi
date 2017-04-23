class UsersController < ApplicationController
  def show
      @user = User.find(params[:id])
      @images = Image.where("user_id = ?", params[:id])
  end
end
