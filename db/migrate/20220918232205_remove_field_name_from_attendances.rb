class RemoveFieldNameFromAttendances < ActiveRecord::Migration[6.1]
  def change
    remove_column :attendances, :signup, :boolean
    remove_column :attendances, :attended, :boolean
  end
end
