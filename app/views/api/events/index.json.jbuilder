json.array! @events.each do |event|
  json.id event.id
  json.title event.name
  json.address event.address
  json.thumbnail event.main_image
  json.latitude event.location.latitude
  json.longitude event.location.longitude
  json.verified false

  json.reports event.reports
  json.overall_rating event.overall_rating
  json.datetime event.datetime
  json.event_type event.event_type
  json.distance event.distance

  json.location event.location.name
  json.location_details event.location
end