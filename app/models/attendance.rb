# frozen_string_literal: true

# Model for attendance
class Attendance < ApplicationRecord
  validates :event_id, :userid, :password, presence: true
  # provides a one-to-many relationship with event
  belongs_to :event
  has_many :users

  # Check each error adding message if popped
  def self.error_checks(attendance)
    errors = []
    errors.append('No Event Entered') unless check_user_input(attendance)
    errors.append('No User Entered') unless check_event_input(attendance)
    if errors.empty?
      error_checks_two(attendance)
    else
      errors
    end
  end

  def self.error_checks_two(attendance)
    errors = []
    errors.append('Registration Closed') unless check_attendance_time(attendance)
    errors.append('User Already Registered') unless check_user_exists(attendance)
    errors.append('Incorrect Password') unless check_password(attendance)
    errors
  end

  def self.check_event_input(attendance)
    !attendance.userid.nil?
  end

  def self.check_user_input(attendance)
    !attendance.event_id.nil?
  end

  # Check password is correct
  def self.check_password(attendance)
    attendance.password == Event.find(attendance.event_id).logincode
  end

  # Check if user has already registered
  def self.check_user_exists(attendance)
    Attendance.where(userid: attendance.userid, event_id: attendance.event_id).empty?
  end

  # Check if registration is open
  def self.check_attendance_time(attendance)
    start_time = Event.find(attendance.event_id).starttime
    end_time = Event.find(attendance.event_id).endtime
    current_time = DateTime.now.in_time_zone('US/Central')
    #    date = Event.find(@attendance.event_id).date
    #    current_date = Date.today
    #    flash[:notice] = start_time
    ((current_time > start_time) && (current_time < end_time))
  end

  def self.add_points(eventid, userid)
    event = Event.find(eventid)
    user = User.find(userid)
    user.userpoints = user.userpoints + event.eventpoints
    user.usertotal = user.usertotal + event.eventpoints
    user.save!
  end
end
