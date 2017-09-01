class User < ApplicationRecord
  has_secure_password
  has_many :registrations
  has_many :reports
  has_many :events, through: :registrations
  has_many :sports, through: :events

  def registration_status(input_event_id)
    return Registration.where("user_id = ? AND event_id = ?", self.id, input_event_id).first.status
  end

  def registration_for(event)
    current_registration = self.registrations.find_by(event_id: event.id)
    return current_registration
  end

  def report_for(event)
    current_registration = self.registrations.find_by(event_id: event.id)
    if current_registration
      return self.reports.find_by(registration_id: current_registration.id)
    else
      return nil
    end
  end
end
