# frozen_string_literal: true

# Migration for rsvps
class CreateRsvps < ActiveRecord::Migration[6.1]
  def change
    create_table :rsvps do |t|
      t.belongs_to :event
      t.belongs_to :user
      t.boolean :rsvped

      t.timestamps
    end
  end
end
