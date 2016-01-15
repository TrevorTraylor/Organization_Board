class UsersController < ApplicationController
	include UsersHelper
  def index
  	@users = User.all
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		sign_in @user
  		redirect_to users_path, notice: "User was successfully created!"
  	else
  		flash[:errors_register] = @user.errors.full_messages
  		redirect_to :back
  	end
  end

  def new
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update_attributes(user_params)
  		redirect_to users_path, notice: "Your profile was successfully updated!"
  	else
  		flash[:errors] = @user.errors.full_messages
  		redirect_to :back
  	end
  end

  def destroy
  	@user = User.find(params[:id]).destroy
  	sign_out
  	redirect_to users_path, notice: "Your profile was successfully deleted"
  end


  private
  	def user_params
  		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  	end
end
