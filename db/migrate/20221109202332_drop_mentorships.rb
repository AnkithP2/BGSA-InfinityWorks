# frozen_string_literal: true

class DropMentorships < ActiveRecord::Migration[6.1]
  def up
    drop_table :mentorships
  end

  # Once we drop a table we won't be able to create it
  def down
    raise ActiveRecrod::IrreversibleMigration
  end
end
