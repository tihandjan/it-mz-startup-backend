class CreateRecipesIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes_ingredients do |t|
      t.references :recipe, foreign_key: true
      t.references :ingredient, foreign_key: true
      t.integer :amount
      t.string :unit, default: 'gramm'

      t.timestamps
    end
  end
end
