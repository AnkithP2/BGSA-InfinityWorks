class RemoveFieldNameFromRsvps < ActiveRecord::Migration[6.1]
  def change
    remove_column :rsvps, :rsvped, :boolean
  end
end
