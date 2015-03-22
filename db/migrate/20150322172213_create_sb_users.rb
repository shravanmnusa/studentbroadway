class CreateSbUsers < ActiveRecord::Migration
  def change
    create_table :sb_users do |t|
      t.string :name
      t.string :email

      t.timestamps null: false
    end
  end
end
