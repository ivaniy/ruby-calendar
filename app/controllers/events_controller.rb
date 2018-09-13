class EventsController < ApplicationController
  before_action :load_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = current_user.events.sort_by { |e| e.start_at }
  end

  def show; end

  def new
    @event = Event.new
  end

  def edit; end

  def create
    @event = current_user.events.new(event_params)
    if @event.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    if @event.update(event_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @event.destroy
    redirect_to root_path
  end

  private

  def load_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :location, :date, :start_at, :end_at)
  end
end
