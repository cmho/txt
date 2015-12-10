class PostController < ApplicationController
	def show

	end

	def new
		
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

	end

	private

	def post_params
		params.require(:post).permit(:content, :user_id, :id)
	end
end