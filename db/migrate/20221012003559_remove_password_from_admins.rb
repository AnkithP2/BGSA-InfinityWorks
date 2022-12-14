# frozen_string_literal: true

# Migration for removal password
class RemovePasswordFromAdmins < ActiveRecord::Migration[6.1]
  def change
    remove_column :admins, :password, :string
  end
end
