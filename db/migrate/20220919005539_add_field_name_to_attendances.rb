class AddFieldNameToAttendances < ActiveRecord::Migration[6.1]
  def change
    add_column :attendances, :password, :string
  end
end
