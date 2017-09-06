class EventsController < ApplicationController
  def index
    @events = Event.where("event_type = ?", "Race")
    @locations = Location.all.order(:name)
    @sports = Sport.all.order(:name)
    @countries = {}
    @locations.each do |location|
      if !@countries[location.country]
        @countries[location.country] = true
      end
    end
    @countries = @countries.sort
    render "index.html.erb"
  end

  def show
    @event = Event.find_by(id: params[:id])
    @registrants = @event.users.where("registrations.status != ?", "Cancelled").order(:last_name, :first_name)
    @event.reports != [] ? @reports = @event.reports : @reports = @event.related_reports

    render "show.html.erb"
  end

  def races
    user = params[:user]
    sport_id = params[:sport_id]
    search = params[:search]

    events = Event.where("event_type = ?", "Race")

    if search
      events = events.where("name ILIKE ? OR description ILIKE ? OR distance ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
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
  end
end
