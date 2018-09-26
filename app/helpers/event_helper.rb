module EventHelper
  def event_badge(event)
    events_user = event.events_users.find_by(user: current_user)
    if event.creator == current_user
      content_tag(:span, 'c', class: 'badge badge-primary')
    elsif events_user.accepted?
      content_tag(:span, 'a', class: 'badge badge-success')
    elsif events_user.tentative?
      content_tag(:span, 'm', class: 'badge badge-secondary')
    else
      content_tag(:span, 'n', class: 'badge badge-danger')
    end
  end

  def events_user_state(event, user)
    event.events_users.find_by(user: user).state
  end
end
