# frozen_string_literal: true

# Migration for start/end data
class ChangeStarttimeEndtimeDataType < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :starttime_datetime, :datetime
    remove_column :events, :starttime
    rename_column :events, :starttime_datetime, :starttime

    add_column :events, :endtime_datetime, :datetime
    remove_column :events, :endtime
    rename_column :events, :endtime_datetime, :endtime
  end
end
