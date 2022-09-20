class CreateRsvps < ActiveRecord::Migration[6.1]
  def change
    create_table :rsvps do |t|
      t.belongs_to :event
      t.integer :userid
      t.boolean :rsvped

      t.timestamps
    end
  end
end