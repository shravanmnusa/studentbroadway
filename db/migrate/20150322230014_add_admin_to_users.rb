class AddAdminToUsers < ActiveRecord::Migration
  def change
    add_column :sb_users, :admin, :boolean
  end
end
