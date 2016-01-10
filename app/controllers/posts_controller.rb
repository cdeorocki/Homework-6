class PostsController < ApplicationController
	
	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def show
		@post = Post.find(params[:id])

	rescue ActiveRecord::RecordNotFound
		flash[:error] = "Could not find the post you were looking for."
		redirect_to posts_path
	end	

	def update
		@post = Post.find(params[:id])
		@post.update_attributes(post_params)
		redirect_to posts_path
	end	

	def create
		@post = Post.create(post_params)
		redirect_to posts_path
	end

	def edit
		@post = Post.find(params[:id])
	end	

	private
	def post_params
		params.require(:post).permit(:title, :author, :content)
	end	
end	

# @post = Post.edit(post_params)
# redirect_to edit_posts_path