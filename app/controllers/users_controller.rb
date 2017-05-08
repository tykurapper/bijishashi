class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@images = Image.where("user_id = ?", params[:id])
	end
	def index
		@user = User.all
	end
	def following
		@title = "Following"
		@user  = User.find(params[:id])
		@users = @user.following.paginate(page: params[:page])
		render '_show_follow'
	end

	def followers
		@title = "Followers"
		@user  = User.find(params[:id])
		@users = @user.followers.paginate(page: params[:page])
		render '_show_follow'
	end
end
