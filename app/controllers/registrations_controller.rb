
class RegistrationsController < Devise::RegistrationsController
	def update
		@user = current_user
		if @user.update_attributes user_params
			flash[:success] = "Success"
			redirect_to showuser_path(@user)
		else
			render 'edit'
		end
	end

	private 

	def user_params
		params.require(:user).permit(:email, :fullname, :info, :password, :password_comfirmation, :avatar)
	end
end