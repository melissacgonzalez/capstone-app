class User < ApplicationRecord
  has_secure_password
  has_many :registrations
  has_many :reports
  has_many :events, through: :registrations
  has_many :sports, through: :events

  def registration_status(input_event_id)
    return Registration.where("user_id = ? AND event_id = ?", self.id, input_event_id).first.status
  end
end
