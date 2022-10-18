# frozen_string_literal: true

# Migration for goals
class CreateGoals < ActiveRecord::Migration[6.1]
  def change
    create_table :goals do |t|
      t.belongs_to :mentorship
      t.string :goal
      t.string :status

      t.timestamps
    end
  end
end
