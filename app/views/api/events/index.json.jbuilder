json.array! @events.each do |event|
  json.id event.id
  json.title event.name
  json.datetime event.datetime
  json.event_type event.event_type
  json.distance event.distance

  json.sport (event.sport ? event.sport.name : nil)
  json.location event.location.name
  
  json.thumbnail event.main_image

  json.address event.address
  json.country event.location.country
  json.latitude event.location.latitude
  json.longitude event.location.longitude
  json.verified false

  json.overall_rating event.overall_rating
  json.related_rating event.related_rating

  json.registrant_count event.registrations.where("status != ?", "Cancelled").count
  json.popularity event.popularity
  
end