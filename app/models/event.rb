class Event < ApplicationRecord
  belongs_to :sport, optional: true
  belongs_to :location
  has_many :registrations
  has_many :reports, through: :registrations
  has_many :users, through: :registrations

  def overall_rating
    ratings = self.reports.map{|report| report.overall_rating}
    sum_ratings = ratings.reduce{|sum, rating| sum + rating}
    average_rating = sum_ratings / ratings.length
    return average_rating.round(1)
  end
end
