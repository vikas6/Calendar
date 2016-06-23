class EventsController < ApplicationController
  def new
  	@event=Event.new
  end

  def create
  	@event = current_user.events.new(title: params[:title])
  	if @event.save
    	redirect_to events_url, :notice => "Create Event!"
  	end
  end

  def edit

  end
end
