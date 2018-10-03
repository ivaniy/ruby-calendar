class EventMailer < ApplicationMailer
  default from: 'notifications@example.com'
  layout 'mailer'

  def invitation_to_event(user, event)
    @user = user
    @event = event
    mail(to: @user.email, subject: 'Invitation to event')
  end

  def user_response(user, event, response)
    @user = user
    @event = event
    @response = response
    @creator = @event.creator
    mail(to: @creator.email, subject: 'User response')
  end

  def cancel_event(user, event)
    @user = user
    @event = event
    @creator = @event.creator
    mail(to: @user.email, subject: 'Event was canceled')
  end
end
