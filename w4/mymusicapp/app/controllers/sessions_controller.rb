class SessionsController < ApplicationController

	def new
		render :new
	end

	def create
		@user = User.find_by_credentials(user_params[:email], user_params[:password])
		if @user
			session[:session_token] = user.session_token
			redirect_to user_url
		else
			render :new
		end
	end

	def destroy
		current_user.reset_session_token!
		redirect_to new_session_url
	end

	private

	def user_params
		params.require(:user).permit(:email, :password)
	end
end
