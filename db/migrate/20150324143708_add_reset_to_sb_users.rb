class AddResetToSbUsers < ActiveRecord::Migration
  def change
    add_column :sb_users, :reset_digest, :string
    add_column :sb_users, :reset_sent_at, :datetime
  end
end
