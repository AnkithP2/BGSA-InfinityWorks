# frozen_string_literal: true

class Book < ApplicationRecord
  validates :title, presence: true
end
