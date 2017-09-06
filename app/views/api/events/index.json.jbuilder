json.array! @events.each do |event|
  json.id event.id
  json.title event.name
  json.datetime event.datetime
  json.description event.description
  json.event_type event.event_type
  json.distance event.distance

  json.sport (event.sport ? event.sport.name : nil)
  json.location event.location.name
  json.location_details event.location
  
  json.thumbnail event.main_image

  json.address event.address
  json.latitude event.location.latitude
  json.longitude event.location.longitude
  json.verified false

  json.reports event.reports
  json.overall_rating event.overall_rating
  json.related_rating event.related_rating

  json.registrant_count event.registrations.where("status != ?", "Cancelled").count
  json.popularity event.popularity
  
end