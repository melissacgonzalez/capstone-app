class ResultsController < ApplicationController
  def index
    @itu_events = Event.where("itu_event_id IS NOT ?", nil)
    render "index.html.erb"
  end

  def show
    @event = Event.find_by(id: params[:id])
    event_programs = []
    if @event.itu_event_id
      event_programs = Unirest.get("https://api.triathlon.org/v1/events/#{@event.itu_event_id}/programs?prog_name=%25Elite%25", headers:{ "apikey" => ENV["TRIATHLON_ORG_API_KEY"] }).body["data"]
    end
    @results = event_programs.map { |program|
      Unirest.get("https://api.triathlon.org/v1/events/#{@event.itu_event_id}/programs/#{program["prog_id"]}/results?limit=5", headers:{ "apikey" => ENV["TRIATHLON_ORG_API_KEY"] }).body["data"]
    }.select { |program|
      program["results"] != []
    }
    
    render "show.html.erb"
  end
end

