# frozen_string_literal: true

# Migration for add for attendances
class AddFieldNameToAttendances < ActiveRecord::Migration[6.1]
  def change
    add_column :attendances, :password, :string
  end
end
