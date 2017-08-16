class EventsController < ApplicationController
  def index
    user = params[:user]
    event_type = params[:type]
    sport_id = params[:sport_id]
    search = params[:search]

    if user && event_type
      events = current_user.events.where("event_type = ?", event_type)
    elsif event_type
      events = Event.where("event_type = ?", event_type)
    elsif search
      events = Event.where("name ILIKE ? OR description ILIKE ? OR distance ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      events = Event.all
    end

    if sport_id
      events = events.where("sport_id = ?", sport_id)
    end

    if params[:location_id]
      events = events.where("location_id = ?", params[:location_id])
    end
    
    if params[:past]
      @events = events.where("datetime < ?", "now()").order(:datetime => "desc")
    else
      @events = events.where("datetime >= ?", "now()").order(:datetime)
    end
    @locations = Location.all.order(:name).select{ |location| location.events.where("datetime > ?", "now()") != [] }
    @sports = Sport.all.order(:name).select{ |sport| sport.events.where("datetime > ?", "now()") != [] }
    render "index.html.erb"
  end

  def show
    @event = Event.find_by(id: params[:id])
    @registrants = @event.users.where("registrations.status != ?", "Cancelled").order(:last_name, :first_name)

    render "show.html.erb"
  end
end
