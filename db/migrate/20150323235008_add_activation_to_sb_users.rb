class AddActivationToSbUsers < ActiveRecord::Migration
  def change
    add_column :sb_users, :activation_digest, :string
    add_column :sb_users, :activated, :boolean
    add_column :sb_users, :activated_at, :datetime
  end
end
