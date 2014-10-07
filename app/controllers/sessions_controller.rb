class SessionsController < ApplicationController
	
	def new
	end

	def show
	end

	def create
		@user = User.where(username: params[:username]).first
     if @user && @user.password == params[:password]
     	flash[:notice] = 'Logged in successfully!'
     	session[:user_id] = @user.id
     	current_user
     	redirect_to user_path @user

     else
     	flash[:notice] = 'Error logging in. Try again.'
     	redirect_to new_session_path
     end

	end

	def destroy
		session[:user_id] = nil
		flash[:notice] = 'Logged out successfully'
    redirect_to root_path
	end
end
