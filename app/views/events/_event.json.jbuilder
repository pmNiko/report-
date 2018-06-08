date_format = event.all_day_event? ? '%Y-%m-%d' : '%Y-%m-%dT%H:%M:%S'

json.id event.id
json.title event.title
json.start event.star_time.strftime(date_format)
json.end event.end_time.strftime(date_format)

json.update_url event_path(event, method: :patch)
json.edit_url edit_event_path(event)
