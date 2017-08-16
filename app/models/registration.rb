class Registration < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :reports
end
