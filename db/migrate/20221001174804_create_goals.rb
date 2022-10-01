class CreateGoals < ActiveRecord::Migration[6.1]
  def change
    create_table :goals do |t|
      t.references :mentorship_id, null: false, foreign_key: true
      t.string :goal
      t.string :status

      t.timestamps
    end
    add_foreign_key :goals, :mentorships, column: :mentorship_id

  end
end
