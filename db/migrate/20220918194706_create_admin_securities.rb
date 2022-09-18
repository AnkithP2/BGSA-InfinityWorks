class CreateAdminSecurities < ActiveRecord::Migration[6.1]
  def change
    create_table :admin_securities do |t|
      t.belongs_to :admins
      t.date :last_login

      t.timestamps
    end
  end
end
