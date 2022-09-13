class Event < ApplicationRecord
  #provides a one-to-many relationship with attendence
  has_many :attendances
end
