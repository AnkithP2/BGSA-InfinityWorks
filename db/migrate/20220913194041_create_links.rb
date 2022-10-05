class CreateLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :links do |t|
      t.string :section
      t.string :title
      t.string :link

      t.timestamps
    end
  end
end
