class Rsvp < ApplicationRecord
    validates :event_id, :userid, presence: true
    belongs_to :event
    has_many :users

    #Check each error adding message if popped
    def self.error_checks(rsvp)
        errors = []
        if !check_rsvp_time(rsvp)
            errors.append("Registration Closed")
        end
        if !check_user_exists(rsvp)
            errors.append("User Already Registered")
        end
        return errors
    end
    
    #Check if user has already registered
    def self.check_user_exists(rsvp)
        return Rsvp.where(:userid => rsvp.userid, :event_id => rsvp.event_id).empty?
    end
    
    #Check if registration is open
    def self.check_rsvp_time(rsvp)
        start_time = Event.find(rsvp.event_id).starttime
        current_time = DateTime.now.in_time_zone('US/Central')
        return (current_time < start_time)
    end
end
