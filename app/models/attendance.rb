class Attendance < ApplicationRecord
  validates :event_id, :userid, :password, presence: true
  #provides a one-to-many relationship with event
  belongs_to :event
  #has_many :users
end
