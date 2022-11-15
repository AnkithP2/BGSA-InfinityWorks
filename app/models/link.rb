# frozen_string_literal: true

class Link < ApplicationRecord
  validates :section_id, :title, :link, presence: true
  belongs_to :section

  # only allows alphabetic characters and removes newline options
  validates :title, format: { with: /[A-Za-z]+\z/ }

  # protects against SQL attacks and checks for common SQL statements
  validates :title, :link, format: { without: /'(''|[^'])*'/ }
  validates :title, :link,
            format: { without: /\b(ALTER|CREATE|DELETE|DROP|EXEC(UTE){0,1}|INSERT( +INTO){0,1}|MERGE|SELECT|UPDATE|UNION( +ALL){0,1})\b/ }
end
