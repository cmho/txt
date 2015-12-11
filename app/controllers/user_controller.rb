class UserController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		@user.password = params[:user][:password]
		if @user.save!
			session[:user] = @user.id
			redirect_to :root
		else
			redirect_to :register_path
		end
	end

	def show
		@user = User.find_by_username(params[:username])
		if session[:user]
			@current_user = User.find(session[:user])
			if @current_user.present? && @current_user.follows.collect {|x| x.following_id }.include?(@user.id)
				@following_user = true
			else
				@following_user = false
			end
		end
		@posts = Post.where(user_id: @user.id).order(created_at: :desc)
	end

	def edit
		if (session[:user].nil?)
			redirect_to login_path
		end
		@user = User.find(session[:user])
	end

	def update
		@user = User.find(session[:user])
		puts "break 1"
		if @user.update_attributes!(user_params)
			puts "break 2"
			flash[:success] = "Your settings were updated."
		else
			puts "break 3"
			flash[:error] = "There was an error updating your settings."
		end
		puts "break 4"
		redirect_to settings_path
	end

	def following
		@user = User.find_by_username(params[:username])
		@follows = Follow.where(user_id: @user.id)
		@followed_users = User.find(@follows.collect{|x| x.following_id})
	end

	def followed_by
		@user = User.find_by_username(params[:username])
		@follows = Follow.where(following_id: @user.id)
		@followers = User.find(@follows.collect {|x| x.user_id})
	end

	def follow
		@user = User.find_by_username(params[:username])
		@follow = Follow.new(user_id: session[:user], following_id: @user.id)
		@follow.save!
		redirect_to user_path(@user.username)
	end

	def unfollow
		@user = User.find_by_username(params[:username])
		@follow = Follow.where(user_id: session[:user], following_id: @user.id)
		@follow.delete_all
		redirect_to user_path(@user.username)
	end

	private

	def user_params
		params.require(:user).permit(:id, :username, :display_name, :password_digest, :password, :email)
	end
end
