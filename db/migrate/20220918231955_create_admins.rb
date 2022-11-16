# frozen_string_literal: true

# Migration for admins
class CreateAdmins < ActiveRecord::Migration[6.1]
  def change
    create_table :admins do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string 'password_digest'

      t.timestamps
    end
  end
end
