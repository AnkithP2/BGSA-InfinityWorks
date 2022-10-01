class Mentorship < ApplicationRecord
  has_many :goals

  belongs_to :mentor_id
  belongs_to :mentee_id
  # , class_name: 'User'
end
