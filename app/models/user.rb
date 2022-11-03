# frozen_string_literal: true

class User < ApplicationRecord
  validates :firstname, :lastname, :userpoints, :usertotal, presence: true
  has_many :attendances
  has_many :rsvps

  # only allows alphabetic characters and removes newline options
  validates :firstname, :lastname, format: { with: /[A-Za-z]+\z/}

  # checks numericality of userpoints and usertotal
  # only allows integers
  validates :userpoints, :usertotal, numericality: { only_integer: true }

  # where foreign_key is = to the supplied user id
  has_many :mentees, class_name: 'Mentorship', foreign_key: 'mentor_id'
  has_many :mentors, class_name: 'Mentorship', foreign_key: 'mentee_id'
end
