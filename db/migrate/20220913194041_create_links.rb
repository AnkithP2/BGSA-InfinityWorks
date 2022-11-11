# frozen_string_literal: true

# Migration for links
class CreateLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :links do |t|
      t.belongs_to :section
      t.string :title
      t.string :link

      t.timestamps
    end
  end
end
