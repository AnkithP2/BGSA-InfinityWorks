# frozen_string_literal: true

# Migration for attendaces
class CreateAttendances < ActiveRecord::Migration[6.1]
  def change
    create_table :attendances do |t|
      t.belongs_to :event
      t.integer :userid
      t.boolean :signup
      t.boolean :attended

      t.timestamps
    end
  end
end
