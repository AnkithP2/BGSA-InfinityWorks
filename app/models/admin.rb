# frozen_string_literal: true

class Admin < ApplicationRecord
  validates :name, :email, presence: true

  # only allows alpha characters and removes newline options
  validates :name, format: { with: /\A[A-Za-z]+\z/ }

  # protects against SQL attacks and checks for common SQL statements
  validates :name, format: { without: /'(''|[^'])*'/ }
  validates :name, format: { without: /\b(ALTER|CREATE|DELETE|DROP|EXEC(UTE){0,1}|INSERT( +INTO){0,1}|MERGE|SELECT|UPDATE|UNION( +ALL){0,1})\b/ }

  # only allows proper email formats
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_secure_password
end
