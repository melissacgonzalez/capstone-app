class ReportsController < ApplicationController
  def index
    @reports = Report.all
    search = params[:search]

    if params[:user]
      @reports = current_user.reports
    end

    if search
      @reports = @reports.where("title ILIKE ?", "%#{search}%")
    end

    render "index.html.erb"
  end

  def new
    @report = Report.new(overall_rating: 5, registration_id: params[:reg_id])
    @events = current_user.events.where("datetime < ?", "now()").order(:datetime => "desc")
    render "new.html.erb"
  end

  def create
    registration = current_user.registrations.where("event_id = ?", "#{params[:event_id]}").first
    Report.create(
      user_id: current_user.id,
      registration_id: registration.id,
      title: params[:title],
      body: params[:body],
      overall_rating: params[:overall_rating],
      bib_number: params[:bib_number]
      )
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
    @report = Report.find_by(id: params[:id])
    @report.title = params[:title] if params[:title]
    @report.body = params[:body] if params[:body]
    @report.overall_rating = params[:overall_rating] if params[:overall_rating]
    @report.bib_number = params[:bib_number] if params[:bib_number]
    @report.save
    redirect_to "/reports/#{@report.id}"
  end

  def destroy
    redirect_to "/reports"
  end
end
