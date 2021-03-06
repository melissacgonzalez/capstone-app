class UsersController < ApplicationController
  def index
    @users = User.all.order(:last_name, :first_name)
    render "index.html.erb"
  end

  def new
    if current_user
      redirect_to "/events"
    else
      render "new.html.erb"
    end
  end

  def create
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      bio: params[:bio],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      avatar: params[:avatar]
    )
    if user.save
      session[:user_id] = user.id
      flash[:success] = 'Successfully created account!'
      redirect_to '/'
    else
      flash[:warning] = 'Invalid email or password!'
      redirect_to '/signup'
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @races = @user.events.where("event_type = ? AND registrations.status != ?", "Race", "Cancelled")
    if @user.itu_athlete_id
      @itu_results = Unirest.get("https://api.triathlon.org/v1/athletes/#{@user.itu_athlete_id}/results?per_page=10", headers:{ "apikey" => ENV["TRIATHLON_ORG_API_KEY"] }).body["data"]
    end
    render "show.html.erb"
  end
end
