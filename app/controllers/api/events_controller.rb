class Api::EventsController < ApplicationController
  def index
    @events = Event.where("event_type = ?", "Race")
    render "index.json.jbuilder"
  end
end
