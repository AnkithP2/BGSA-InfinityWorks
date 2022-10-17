class Mentorship < ApplicationRecord
  has_many :goals

  belongs_to :mentor, :class_name => 'User'
  belongs_to :mentee, :class_name => 'User'
  # , class_name: 'User'
end
