class HomeController < ApplicationController
	def index
		if session[:user].present?
			@user = User.find(session[:user])
			@posts = Post.where(user_id: @user.follows.collect {|x| x.following_id }.push(session[:user])).order(created_at: :desc)
		else
			redirect_to :login
		end
	end
end
