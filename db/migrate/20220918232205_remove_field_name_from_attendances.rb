# frozen_string_literal: true

# Migration for removal of name from attendances
class RemoveFieldNameFromAttendances < ActiveRecord::Migration[6.1]
  def change
    remove_column :attendances, :signup, :boolean
    remove_column :attendances, :attended, :boolean
  end
end
