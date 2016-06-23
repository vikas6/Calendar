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

  def view
    @user = User.find(current_user.id)
  end

  def profile_edit
    @user = User.find(current_user.id)
  end

  def profile_update
    if params[:first_name] 
      User.update(current_user.id, first_name: params[:first_name], last_name: params[:last_name], email: params[:email], phone_no: params[:phone_no], date_of_birth: params[:date_of_birth])
      redirect_to events_url
    else
      redirect_to profile_edit_url
    end
  end

  def password_edit
  end

  def password_update
    if params[:old_password] && params[:password_hash] && params[:password_salt]
      @user = User.authenticate(current_user.username, params[:old_password])
      if @user
        User.update(current_user.id,password_hash: params[:password_hash], password_salt: params[:password_salt])
        redirect_to events_url
      else
        redirect_to password_edit_url
      end
    end
  end
    
end
