class PostController < ApplicationController
	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		if @post.save!
			flash[:success] = "Update posted!"
			redirect_to :root
		else
			flash[:error] = "There was an error posting your update."
			redirect_to :new_post_path
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.delete_all
		redirect_to :root
	end

	def like
		@like = Like.new(post_id: params[:post_id], user_id: session[:user])
		@like.save!
		redirect_to user_path(params[:username])
	end

	private

	def post_params
		params.require(:post).permit(:content, :user_id, :id)
	end
end