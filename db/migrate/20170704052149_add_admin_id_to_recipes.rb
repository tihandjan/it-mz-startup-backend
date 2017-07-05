class AddAdminIdToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_reference :recipes, :admin, foreign_key: true
    add_column :recipes, :user_type, :string, default: 'user'
  end
end
