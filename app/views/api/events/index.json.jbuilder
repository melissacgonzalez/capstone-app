json.array! @events.each do |event|
  json.(event, :id, :datetime, :name, :event_type, :main_image)
  # need to send across info about location.
end