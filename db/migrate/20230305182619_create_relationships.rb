class CreateRelationships < ActiveRecord::Migration[7.0]
  def change
    create_table :relationships do |t|
      t.integer :followed_id
      t.integer :follower_id
      t.string :status

      t.timestamps
    end
  end
end
