class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  	def create
  		@user = User.new(first_name: params[:user][:first_name], last_name: params[:user][:last_name], email: params[:user][:email], phone_no: params[:user][:phone_no],gender: params[:user][:gender], date_of_birth: params[:user][:date_of_birth], username: params[:user][:username], password_hash: params[:user][:password_hash], password_salt: params[:user][:password_salt])
  		if @user.save
    		redirect_to root_url, :notice => "Signed up!"
  		else
    		render "new"
  		end
  	end
    
end
