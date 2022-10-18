# frozen_string_literal: true

# Model for RSVPs
class Rsvp < ApplicationRecord
  validates :event_id, :userid, presence: true
  belongs_to :event
  has_many :users

  # Check each error adding message if popped
  def self.error_checks(rsvp)
    errors = []
    errors.append('Registration Closed') unless check_rsvp_time(rsvp)
    errors.append('User Already Registered') unless check_user_exists(rsvp)
    errors
  end

  # Check if user has already registered
  def self.check_user_exists(rsvp)
    Rsvp.where(userid: rsvp.userid, event_id: rsvp.event_id).empty?
  end

  # Check if registration is open
  def self.check_rsvp_time(rsvp)
    start_time = Event.find(rsvp.event_id).starttime
    current_time = DateTime.now.in_time_zone('US/Central')
    (current_time < start_time)
  end
end
