class StaticPagesController < ApplicationController
  def home
  	if user_signed_in?
  		following_ids = "SELECT followed_id FROM relationships
                     WHERE  follower_id = #{current_user.id}"
		@image = Image.where("user_id IN (#{following_ids})OR user_id = #{current_user.id}").order("created_at desc")
	end		
  end
end
