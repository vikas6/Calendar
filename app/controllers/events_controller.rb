class EventsController < ApplicationController
  ##layout false, only: :edit
  def home
  	#@events=Event.find(current_user.id)
  	@events = current_user.events
  	@invitations = current_user.invitations
  end

  def new
  	@event=Event.new
  	@users = User.all_except(current_user.id)
  end

  def create
  	@users = User.all_except(current_user.id)
  	@event = current_user.events.new(title: params[:title], start_date: params[:start_date], end_date: params[:end_date], start_time: params[:start_time], end_time: params[:end_time], description: params[:description])
  	if @event.save
  		invitations
  	else
  		render 'new', :notice => "Event not created some thing wrong!"
  	end
  end

  def invitations
  	if params[:user_ids].present?
			params[:user_ids].each do |id|
				@invitation=@event.invitations.new(user_id: id)
				@invitation.save
			end
			redirect_to home_path, :notice => "Create Event!"
		else
	  	render 'new', :notice => "Event not created some thing wrong!"
		end
  end

  def edit
  	@users = User.all_except(current_user.id)
  end
end
