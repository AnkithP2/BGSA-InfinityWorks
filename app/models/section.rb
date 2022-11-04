# frozen_string_literal: true

class Section < ApplicationRecord
  validates :label, presence: true
  has_many :links
end
