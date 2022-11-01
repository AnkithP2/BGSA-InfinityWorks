# frozen_string_literal: true

class Event < ApplicationRecord
  # provides a one-to-many relationship with attendence
  validates :title, :starttime, :endtime, :logincode, :location, :eventpoints, presence: true
  has_many :attendances
  has_many :rsvps

# only allows alphabetic characters and removes newline options
validates :title, format: { with: /[A-Za-z]+\z/}

# onlyl allows start time to be before or at end time
validates :endtime, comparison: { greater_than: starttime:}

# only allows alpha-numeric characters and removes newline options
validates :logincode, format: { with: /[A-Za-z0-9]+\z/}

# protects against SQL attacks and checks for common SQL statements
validates :name, format: { without: /'(''|[^'])*'/}
validates :name, format: { without: /\b(ALTER|CREATE|DELETE|DROP|EXEC(UTE){0,1}|INSERT( +INTO){0,1}|MERGE|SELECT|UPDATE|UNION( +ALL){0,1})\b/}
end
