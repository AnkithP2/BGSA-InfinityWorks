class CreateMentorships < ActiveRecord::Migration[6.1]
  def change
    create_table :mentorships do |t|
      t.references :mentor_id, null: false, foreign_key: true
      t.references :mentee_id, null: false, foreign_key: true

      t.timestamps
    end

    add_foreign_key :mentorships, :users, column: :mentor_id
    add_foreign_key :mentorships, :users, column: :mentee_id

  end
end
