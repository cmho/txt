class HomeController < ApplicationController
	def index
		if session[:user].nil?
			redirect_to :login_path
		end

		@user = User.find(id: session[:user])
		@posts = Post.where(user_id: @user.follows.collect {|x| x.following_id }).order(created_at: :desc).page(params[:page]).per(25)
	end
end
