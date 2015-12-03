class HomeController < ApplicationController
	def index
		if session[:user].nil?
			redirect_to :login_path
		end

		@user = User.find(id: session[:user])
		@following = Follow.find(user_id: session[:user])
	end
end
