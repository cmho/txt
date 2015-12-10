class SessionController < ApplicationController
	def new

	end

	def create
		@user = User.find_by_username(params[:user][:username])
		if @user && @user.password == params[:user][:password]
			flash[:success] = "You've been successfully logged in."
			session[:user] = @user.id
			redirect_to :root
		else
			flash[:error] = "Your username or password was incorrect."
			redirect_to :login
		end
	end

	def destroy

	end
end
