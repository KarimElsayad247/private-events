class EventsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.organized_events.build(event_params)
    if @event.save
      flash[:notice] = "Event created!"
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def event_params
    params.require(:event).permit(:title, :location, :date)
  end
end
