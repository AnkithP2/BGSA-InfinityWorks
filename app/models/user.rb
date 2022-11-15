# frozen_string_literal: true

class User < ApplicationRecord
  validates :firstname, :lastname, :userpoints, :usertotal, presence: true
  has_many :attendances, dependent: :destroy
  has_many :rsvps, dependent: :destroy

  # only allows alphabetic characters and removes newline options
  validates :firstname, :lastname, format: { with: /[A-Za-z]+\z/ }

  # checks numericality of userpoints and usertotal
  # only allows integers
  validates :userpoints, :usertotal, numericality: { only_integer: true }
end
