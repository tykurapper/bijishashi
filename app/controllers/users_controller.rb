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
	
	def live_search
		if(params[:email])
		    @users = User.where("lower(email) LIKE ?", '%' + params[:email].downcase + '%')
		    respond_to do |format|
		      format.js
			end
		end
	end
	
	def search
		if(params[:email])
			@users = User.where("lower(email) LIKE ?", '%' + params[:email].downcase + '%')
			respond_to do |format|
				format.html {redirect_to user_path, users: @users}
			end
		end
	end
end
