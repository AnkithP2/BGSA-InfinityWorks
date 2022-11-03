# frozen_string_literal: true

class Link < ApplicationRecord
  validates :section_id, :title, :link, presence: true
  belongs_to :section
end
