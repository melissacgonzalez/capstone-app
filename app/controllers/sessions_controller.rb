class SessionsController < ApplicationController
  def new
    if current_user
      flash[:warning] = "You are already logged in as #{current_user.first_name} #{current_user.last_name}"
      redirect_to "/users/#{current_user.id}"
    else
      render 'new.html.erb'
    end
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = 'Successfully logged in!'
      redirect_to '/'
    else
      flash[:warning] = 'Invalid email or password!'
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'Successfully logged out!'
    redirect_to '/login'
  end
end
