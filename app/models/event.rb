# frozen_string_literal: true

class Event < ApplicationRecord
  # provides a one-to-many relationship with attendence
  validates :title, :starttime, :endtime, :logincode, :location, :eventpoints, presence: true
  has_many :attendances
  has_many :rsvps
end
