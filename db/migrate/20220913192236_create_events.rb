class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title
      t.date :date
      t.time :starttime
      t.time :endtime
      t.string :logincode
      t.string :location
      t.integer :eventpoints

      t.timestamps
    end
  end
end
