class AddRememberDigestToUsers < ActiveRecord::Migration
  def change
    add_column :sb_users, :remember_digest, :string
  end
end
