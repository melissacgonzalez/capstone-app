class Api::EventsController < ApplicationController
  def index
    @events = Event.where("event_type = ?", "Race")
    render "index.json.jbuilder"
  end

  def show
    @event = Event.find_by(id: params[:id])
    @user = current_user
    render "show.json.jbuilder"
  end
end
