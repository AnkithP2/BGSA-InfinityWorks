class CreateAttendances < ActiveRecord::Migration[6.1]
  def change
    create_table :attendances do |t|
      t.integer :eventid
      t.integer :userid
      t.boolean :signup
      t.boolean :attended

      t.timestamps
    end
  end
end
