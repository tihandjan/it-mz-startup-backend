class CreateIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :calories, default: 0
      t.integer :fats, default: 0
      t.integer :proteins, default: 0
      t.integer :carbohydrates, default: 0
      t.string :image

      t.timestamps
    end
  end
end
