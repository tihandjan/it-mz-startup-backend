class AddRecipesCountAndUsernameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :recipes_count, :integer, default: 0
    add_column :users, :surname, :string
  end
end
