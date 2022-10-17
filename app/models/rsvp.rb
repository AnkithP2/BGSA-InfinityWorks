class Rsvp < ApplicationRecord
    validates :event_id, :userid, presence: true
    belongs_to :event
end
