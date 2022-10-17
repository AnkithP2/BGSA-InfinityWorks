class CreateMentorships < ActiveRecord::Migration[6.1]
  def change
    create_table :mentorships do |t|
      t.references :mentor
      t.references :mentee

      t.timestamps
    end

    add_foreign_key :mentorships, :users, column: :mentor_id, primary_key: :id
    add_foreign_key :mentorships, :users, column: :mentee_id, primary_key: :id

  end
end
