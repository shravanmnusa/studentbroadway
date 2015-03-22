class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
	add_index :sb_users, :email, unique: true
  end
end
