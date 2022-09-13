class Attendance < ApplicationRecord

  #provides a one-to-many relationship with event
  belongs_to :event
end
