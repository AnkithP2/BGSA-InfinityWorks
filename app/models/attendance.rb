class Attendance < ApplicationRecord

  #provides a one-to-many relationship with event
  belongs_to :event
  has_many :users

  #Check each error adding message if popped
  def self.error_checks(attendance)
    errors = []
    if !check_attendance_time(attendance)
      errors.append("Registration Closed")
    end
    if !check_user_exists(attendance)
      errors.append("User Already Registered")
    end
    if !check_password(attendance)
      errors.append("Incorrect Password")
    end
    return errors
  end

  #Check password is correct
  def self.check_password(attendance)
    return attendance.password == Event.find(attendance.event_id).logincode
  end

  #Check if user has already registered
  def self.check_user_exists(attendance)
    return Attendance.where(:userid => attendance.userid, :event_id => attendance.event_id).empty?
  end

  #Check if registration is open
  def self.check_attendance_time(attendance)
    start_time = Event.find(attendance.event_id).starttime
    end_time = Event.find(attendance.event_id).endtime
    current_time = DateTime.now.in_time_zone('US/Central')
  #    date = Event.find(@attendance.event_id).date
  #    current_date = Date.today
  #    flash[:notice] = start_time
    return ((current_time > start_time) && (current_time < end_time))
  end
end
