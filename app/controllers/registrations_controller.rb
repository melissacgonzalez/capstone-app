class RegistrationsController < ApplicationController
  def create
    registration = Registration.new(
      user_id: current_user.id,
      event_id: params[:event_id],
      status: params[:status]
      )
    if registration.save
      flash[:success] = "You've successfully registered!"
    else
      flash[:warning] = "Registration not saved."
    end
    @event = Event.find_by(id: registration.event_id)
    @registrants = @event.users
    redirect_to "/events/#{registration.event_id}"
  end
  
  def edit
    render "edit.html.erb"
  end

  def update
    registration = Registration.find_by(id: params[:id])
    registration.update(
      status: params[:status]
      )
    redirect_to "/events/#{registration.event_id}"
  end
end
