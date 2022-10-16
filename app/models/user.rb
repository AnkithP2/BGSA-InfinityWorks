class User < ApplicationRecord
    #validates :firstname, :lastname, :userpoints, :usertotal, presence: true
    has_many :attendances
    has_many :rsvps

    #where foreign_key is = to the supplied user id
    has_many :mentees, class_name: 'Mentorship', foreign_key: 'mentor_id'
    has_many :mentors, class_name: 'Mentorship', foreign_key: 'mentee_id'
end