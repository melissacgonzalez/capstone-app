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
    return "#{self.location.street_address} #{self.location.city} #{self.location.state} #{self.location.zip}"
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
    keywords = self.name.split(" ")
    query = keywords.select{|keyword| /[[:alpha:]]/.match(keyword)}
    related_races = Event.where("name ILIKE ? AND event_type = ? AND id != ?", "%#{query[0]} #{query[1]}%", "Race", self.id)
    return related_races
  end

  def related_reports
    related_races = self.related_races
    reports_arrays = related_races.map { |race| race.reports }.select { |reports| reports != []}
    reports = []
    reports_arrays.each do |reports_array|
      reports_array.each do |report|
        reports << report
      end
    end
  end

  def related_rating
    related_races = self.related_races
    race_ratings = related_races.map { |race| race.overall_rating }.select { |rating| rating > 0 }
    if race_ratings.count > 0
      average_rating = (race_ratings.reduce(0) { |sum, rating| sum + rating })/race_ratings.count
      return average_rating.round(1)
    else
      return -1
    end
  end

  def popularity
    registrant_count = self.registrations.where("status != ?", "Cancelled").count
    if self.overall_rating > 0
      popularity = registrant_count * self.overall_rating
    elsif self.related_rating > 0
      popularity = registrant_count * self.related_rating
    else
      popularity = registrant_count
    end
    return popularity
  end
end
