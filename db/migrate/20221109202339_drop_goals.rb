# frozen_string_literal: true

class DropGoals < ActiveRecord::Migration[6.1]
  def up
    drop_table :goals
  end

  # Once we drop a table we won't be able to create it
  def down
    raise ActiveRecrod::IrreversibleMigration
  end
end
