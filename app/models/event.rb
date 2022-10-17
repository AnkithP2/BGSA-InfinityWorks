class Event < ApplicationRecord
  #provides a one-to-many relationship with attendence
  validates :title, :date, :starttime, :endtime, :logincode, :location, :eventpoints, presence: true
  has_many :attendances
end