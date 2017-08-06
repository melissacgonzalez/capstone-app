class EventsController < ApplicationController
  def index
    @events = Event.all.where("datetime > ?", "now()")
    @events = @events.order(:datetime)
    render "index.html.erb"
  end

  def show
    @event = Event.find_by(id: params[:id])
    @registrants = @event.users.where("registrations.status != ?", "Cancelled").order(:last_name, :first_name)
    @average_rating = 
    render "show.html.erb"
  end
end
