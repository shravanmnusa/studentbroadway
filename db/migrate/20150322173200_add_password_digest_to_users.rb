class AddPasswordDigestToUsers < ActiveRecord::Migration
  def change
    add_column :sb_users, :password_digest, :string
  end
end
