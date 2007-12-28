class Appointment < ActiveRecord::Base
  belongs_to :client
  validates_presence_of :occurs_on, :starts_at, :duration, :client
end
