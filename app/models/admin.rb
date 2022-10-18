# frozen_string_literal: true

class Admin < ApplicationRecord
  validates :name, :email, presence: true
  has_secure_password
end
