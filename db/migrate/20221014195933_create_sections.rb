# frozen_string_literal: true

# Migration for sections
class CreateSections < ActiveRecord::Migration[6.1]
  def change
    create_table :sections do |t|
      t.string :label

      t.timestamps
    end
  end
end
