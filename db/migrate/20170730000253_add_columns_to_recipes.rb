class AddColumnsToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_reference :recipes, :country, foreign_key: true
    add_reference :recipes, :category, foreign_key: true
    add_reference :recipes, :sub_category, foreign_key: true
  end
end
