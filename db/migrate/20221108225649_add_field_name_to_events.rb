class AddFieldNameToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :max_attendance, :integer
  end
end
