class EventsController < ApplicationController
  before_action :load_event, except: [:index, :new, :create]
  before_action :load_events_user, only: [:show, :cancel, :remove, :accept, :maybe, :decline]

  def index
    @events = current_user.events.active_events.sort_by(&:start_event)
  end

  def show; end

  def new
    @event = Event.new
  end

  def edit; end

  def create
    @event = Event.new(event_params)
    if @event.save
      EventsUser.create(event: @event, user: current_user, user_role: 0, state: 'accepted')
      flash[:notice] = 'Event was successfully created'
      send_email_to_invited_users('invitation_to_event', @event)
      redirect_to root_path
    else
      flash[:alert] = 'Event was not created'
      render 'new'
    end
  end

  def update
    if @event.update(event_params)
      flash[:notice] = 'Event was successfully updated'
      redirect_to root_path
    else
      flash[:alert] = 'Event was not updated'
      render 'edit'
    end
  end

  def cancel
    @event.cancel!
    @events_user.decline!
    flash[:notice] = 'Event was canceled'
    send_email_to_invited_users('cancel_event', @event)
    redirect_to root_path
  end

  def remove
    @events_user.decline!
    redirect_to root_path
  end

  EventsUser.aasm.events.map(&:name).each do |response|
    define_method(response) do
      @events_user.send("#{response}!")
      flash[:notice] = "You #{response} this event"
      EventMailer.user_response(current_user, @event, response.to_s).deliver_later
      redirect_to action: :show
    end
  end

  private

  def load_event
    @event = Event.find_by(id: params[:id]) || not_found
  end

  def load_events_user
    @events_user = @event.events_users.find_by(user: current_user) || not_found
  end

  def send_email_to_invited_users(mailer_method, event)
    invited_users = event.participants_users + event.guests_users
    invited_users.each do |invited_user|
      EventMailer.send(mailer_method, invited_user, event).deliver_later
    end
  end

  def event_params
    params.require(:event).permit(:name, :description, :location, :date, :start_event, :end_event, participants_user_ids: [], guests_user_ids: [])
  end
end
