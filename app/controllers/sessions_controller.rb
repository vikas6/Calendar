class SessionsController < ApplicationController
  def new
    
  end
  def create
  user = User.authenticate(params[:username], params[:password])
  if user
    session[:user_id] = user.id
    redirect_to events_url
  else
    flash.now.alert = "Invalid email or password"
    render "new"
  end
end

def destroy
  session[:user_id] = nil
  redirect_to root_url, :alert => "Logged out!"
end
end
