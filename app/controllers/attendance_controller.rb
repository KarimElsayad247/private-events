class AttendanceController < ApplicationController

  before_action :authenticate_user!

  def create
    @event = Event.find(params[:id])
    if @event.attendees.exists?(current_user.id)
      flash[:alert] = "You are already attending!"
    else
      @event.attendees << current_user
      flash[:notice] = "You signed up for the event!"
    end
    redirect_to event_path(@event)
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.attendees.exists?(current_user.id)
      @event.attendees.delete(current_user)
      flash[:notice] = "Attendance canceled!"
    else
      flash[:alert] = "You are already not going!"
    end
    redirect_to event_path(@event)
  end
end
