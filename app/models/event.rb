class Event < ApplicationRecord
  belongs_to :sport, optional: true
  belongs_to :location
  has_many :registrations
  has_many :reports, through: :registrations
  has_many :users, through: :registrations

  def overall_rating
    if self.reports != []
      ratings = self.reports.map{|report| report.overall_rating}
      sum_ratings = ratings.reduce{|sum, rating| sum + rating}
      average_rating = sum_ratings / ratings.length
      return average_rating.round(1)
    else
      return -1
    end
  end

  def address
    return "#{self.location.street_address}, #{self.location.city}, #{self.location.state} #{self.location.zip}"
  end

  def time_until
    total_seconds_until = self.datetime - Time.now
    days_until = total_seconds_until/(60*60*24) #60s/ min, 60m/hr, 24hr/day
    hours_until = (days_until - days_until.floor) * 24
    minutes_until = (hours_until - hours_until.floor) * 60
    seconds_until = (minutes_until - minutes_until.floor) * 60
    return {
      days: days_until.floor,
      hours: hours_until.floor,
      minutes: minutes_until.floor,
      seconds: seconds_until.floor
    }
  end

  def related_races
    keywords = self.name.split(" ").shift
    related_races = []
    Event.all.each do |event|
      event_words = event.name.split(" ").shift
    end
    return related_races
  end
end
