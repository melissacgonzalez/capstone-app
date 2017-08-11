class ReportsController < ApplicationController
  def index
    @reports = Report.all
    render "index.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    redirect_to "/reports"
  end

  def show
    render "show.html.erb"
  end

  def edit
    render "edit.html.erb"
  end

  def update
    redirect_to "/reports/#{@report.id}"
  end

  def destroy
    redirect_to "/reports"
  end
end
