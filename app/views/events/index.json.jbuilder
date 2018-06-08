json.array! @events do |event|
  json.extract! event, :id, :description
  json.start event.star_time
  json.end event.end_time
  json.type_event event.type_event
  json.user_id event.user_id
  json.url event_url(event, format: :html)
end
