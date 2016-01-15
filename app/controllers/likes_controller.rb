class LikesController < ApplicationController
	include LikesHelper
	def create
		if (Like.where(user_id: session[:user_id], post_id: params[:post_id])).count > 0
			redirect_to :back, notice: "You already joined this!"
		else
			@like = Like.new
			@like.user_id = session[:user_id]
			@like.post_id = params[:post_id]
			@like.save
			redirect_to :back, notice: "You successfully joined this group!"
		end
	end

	def show
		@like = Like.find(params[:id])

  	end

	def destroy
		@like = Like.find(params[:id]).destroy
 	 	redirect_to :back
 	 end
end
