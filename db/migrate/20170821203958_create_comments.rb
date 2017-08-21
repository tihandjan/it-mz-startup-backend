class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.string :commentable_type
      t.integer :commentable_id
      t.integer :user_id
      t.string :user_type

      t.timestamps
    end
    add_index :comments, [:commentable_id, :commentable_type]
    add_index :comments, [:user_id, :user_type]
  end
end
