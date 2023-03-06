class UserRelationship < ActiveRecord::Migration[7.0]
  def change
    create_table :user_relationships do |t|
      t.integer :user_id
      t.integer :followed_user_id
      t.string :status, default: "pending"

      t.timestamps
    end

    add_index :user_relationships, :user_id
    add_index :user_relationships, :followed_user_id
    add_index :user_relationships, [:user_id, :followed_user_id], unique: true
  end
end
