# frozen_string_literal: true

# Migration for start/end data
class ChangeStarttimeEndtimeDataType < ActiveRecord::Migration[6.1]
  def up
    add_column :events, :starttime_datetime, :datetime
    remove_column :events, :starttime
    rename_column :events, :starttime_datetime, :starttime

    add_column :events, :endtime_datetime, :datetime
    remove_column :events, :endtime
    rename_column :events, :endtime_datetime, :endtime
  end
  def down
    rename_column :events, :endtime, :endtime_datetime
    add_column :events, :endtime, :datetime
    remove_column :events, :endtime_datetime

    rename_column :events, :starttime, :starttime_datetime
    add_column :events, :starttime, :datetime
    remove_column :events, :starttime_datetime
  end
end
