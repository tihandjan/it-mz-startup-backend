class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.string :summary
      t.text :image
      t.integer :time
      t.integer :porsion
      t.string :complexity
      t.string :slug
      t.integer :calories, default: 0
      t.integer :proteins, default: 0
      t.integer :fats, default: 0
      t.integer :carbohydrates, default: 0
      t.datetime :publish
      t.integer :rating, default: 0
      t.references :user, foreign_key: true
      t.boolean :approved, default: false

      t.timestamps
    end
    add_index :recipes, :slug, unique: true
  end
end
