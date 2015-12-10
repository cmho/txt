class UserController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		@user.password = params[:user][:password]
		if @user.save!
			redirect_to :root
		else
			redirect_to :register_path
		end
	end

	def show
		@user = User.find_by_username(params[:username])
		@posts = Post.where(user_id: @user.id).order(created_at: :desc)
	end

	def edit

	end

	def update

	end

	private

	def user_params
		params.require(:user).permit(:id, :username, :display_name, :password_digest, :password, :email)
	end
end
