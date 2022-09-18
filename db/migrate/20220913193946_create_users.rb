class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.integer :userpoints
      t.integer :usertotal

      t.timestamps
    end
  end
end
