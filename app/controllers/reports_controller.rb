class ReportsController < ApplicationController
  def index
    @reports = current_user.reports
    render "index.html.erb"
  end

  def new
    @report = Report.create
    @events = current_user.events.where("datetime < ?", "now()").order(:datetime => "desc")
    render "new.html.erb"
  end

  def create
    redirect_to "/reports"
  end

  def show
    @report = Report.find_by(id: params[:id])
    render "show.html.erb"
  end

  def edit
    @report = Report.find_by(id: params[:id])
    @events = Event.where("id = ?", @report.registration.event_id)
    render "edit.html.erb"
  end

  def update
    redirect_to "/reports/#{@report.id}"
  end

  def destroy
    redirect_to "/reports"
  end
end
