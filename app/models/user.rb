class User < ApplicationRecord
    validates :firstname, :lastname, :userpoints, :usertotal, presence: true
    has_many :attendances

    has_many :mentee, class_name: 'Mentorship', foreign_key: 'mentee_id'
    has_many :mentor, class_name: 'Mentorship', foreign_key: 'mentor_id'
end
