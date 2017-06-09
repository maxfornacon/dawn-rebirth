class PostsController < ApplicationController
	before_action :authenticate_user!
	before_action :find_post, only: [:show, :edit, :update, :destroy, :upvote, :downvote,]
	before_action :is_admin?, only: [:new, :create, :edit, :update, :destroy]

	def show
  end

  def new
		@post = current_user.posts.build
  end

  def create
		@post = current_user.posts.build(post_params)

		if @post.save
			redirect_to @post, notice: "erfolgreich gepostetposts"
		else
			render 'new'
		end
  end

  def edit
  end

  def update
		if @post.update(post_params)
			redirect_to @post, notice: "Post geupdatet"
		else
			render 'edit'
		end
  end

	def destroy
		@post.destroy
		redirect_to root_path
	end

	def markdown
	end

	private

		def post_params
			params.require(:post).permit(:title, :body)
		end

		def find_post
			@post = Post.find(params[:id]) 
		end

		def is_admin?
			redirect_to root_path unless current_user.admin?
		end
end
