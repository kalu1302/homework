class SessionController < ApplicationController
	
	def new
		render :new
	end
	
	def create
		@user = User.find_by_credentials(user_params[:email], user_params[:password])
		if @user
			session[:session_token] = user.session_token
			redirect_to #music page
		else
			redirect_to new_session_url
		end
	end
	
	def destroy
		@user.reset_session_token!
		redirect_to new_session_url
	end
	
	private
	
	def user_params
		@params.require(:user).permit(:email, :password)
	end
end
