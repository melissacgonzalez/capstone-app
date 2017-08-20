json.array! @events.each do |event|
  json.id event.id
  json.title event.name
  json.address event.address
  json.thumbnail event.main_image
  json.latitude event.location.latitude
  json.longitude event.location.longitude
  json.verified false
end