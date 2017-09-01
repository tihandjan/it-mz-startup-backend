class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.string :votable_type
      t.integer :votable_id
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :votes, [:votable_type, :votable_id, :user_id], unique: true
  end
end
