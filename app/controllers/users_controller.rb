class UsersController < ApplicationController
  def index
    @users = User.all.order(:last_name, :first_name)
    render "index.html.erb"
  end

  def new
    render "new.html.erb"
  end

  def create
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      bio: params[:bio],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
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
    render "show.html.erb"
  end
end
