# frozen_string_literal: true

class Event < ApplicationRecord
  # provides a one-to-many relationship with attendence
  validates :title, :date, :starttime, :endtime, :logincode, :location, :eventpoints, presence: true
  has_many :attendances, dependent: :destroy
  has_many :rsvps, dependent: :destroy

  # only allows alphabetic characters and removes newline options
  validates :name, format: { with:  /\A[A-Za-z][A-Za-z\'\-]+([\ A-Za-z][A-Za-z\'\-]+)*\z/ }

  # only allows start time to be before or at end time
  # validates :endtime, comparison: { greater_than: :starttime }

  # only allows alpha-numeric characters and removes newline options
  validates :logincode, format: { with: /\A[A-Za-z0-9]+\z/ }

  # protects against SQL attacks and checks for common SQL statements
  validates :title, :logincode, :location, format: { without: /'(''|[^'])*'/ }
  validates :title, :logincode, :location,
            format: { without: /\b(ALTER|CREATE|DELETE|DROP|EXEC(UTE){0,1}|INSERT( +INTO){0,1}|MERGE|SELECT|UPDATE|UNION( +ALL){0,1})\b/ }
end
