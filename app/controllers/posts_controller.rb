class PostsController < ApplicationController
	include PostsHelper
  def index
  	@posts = Post.all.sort {|x,y| y.likes.count <=> x.likes.count}
  	@post = Post.new
  end

  def new
  end

  def create
  	@post = Post.new(post_params)
  	if @post.save
  		redirect_to :back
  	else
  		flash[:errors] = @post.errors.full_messages
  		redirect_to :back
  	end

  end

  def show
  	@post = Post.find(params[:id])
  	@likes = @post.likes
  	flash[:errors] = @post.errors.full_messages
  end

  def destroy
	@post = Post.find(params[:id]).destroy
  	redirect_to :back
  end

  private
  	def post_params
  		params.require(:post).permit(:title, :content, :user_id)
  	end

end
