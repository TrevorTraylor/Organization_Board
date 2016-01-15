class SessionsController < ApplicationController
	include SessionsHelper
  def new
  end

  def create
  	if params[:session][:email].blank?
  		flash[:errors_login] = "Email can not be blank!"
  		redirect_to :back
  	elsif User.find_by(email: params[:session][:email]).nil?
  		flash[:errors_login] = "Oops! We don't recognize this email!"
  		redirect_to :back
  	elsif !(User.find_by(email: params[:session][:email]).try(:authenticate, params[:session][:password]))
  		flash[:errors_login] = "Email and password do not match!"
  		redirect_to :back
  	else
  		user = User.find_by(email: params[:session][:email]).try(:authenticate, params[:session][:password])
  		sign_in user
  		redirect_to users_path
  	end
  end

  	def destroy
  		sign_out
  		redirect_to users_path
  	end
end
