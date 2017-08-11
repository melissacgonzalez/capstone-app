class EventsController < ApplicationController
  def index
    user = params[:user]
    event_type = params[:type]
    sport_id = params[:sport_id]

    if event_type && sport_id
      events = Event.where("event_type = ? AND sport_id = ?", event_type, sport_id)
    elsif user && event_type
      events = current_user.events.where("event_type = ?", event_type)
    elsif event_type
      events = Event.where("event_type = ?", event_type)
    else
      events = Event.all
    end
    
    if params[:past]
      @events = events.where("datetime < ?", "now()").order(:datetime => "desc")
    else
      @events = events.where("datetime >= ?", "now()").order(:datetime)
    end
    @locations = Location.all.order(:name)
    @sports = Sport.all.order(:name)
    render "index.html.erb"
  end

  def show
    @event = Event.find_by(id: params[:id])
    @registrants = @event.users.where("registrations.status != ?", "Cancelled").order(:last_name, :first_name)

    render "show.html.erb"
  end
end
