module EventsHelper
	def show_event(event,date)
		if event.end_date == nil && event.start_time == nil && event.end_time == nil 
	    if event.start_date == date
	      return event.title
	    end
		else 
	    if event.start_date == date &&  event.end_date >= date
	      if event.start_time <= Time.now() || event.end_time >= Time.now()
	      	return event.title
	      end
	    end
	  end
	end
end
