class Goal < ApplicationRecord
    belongs_to :mentorship_id, class_name: 'mentorships'
end
