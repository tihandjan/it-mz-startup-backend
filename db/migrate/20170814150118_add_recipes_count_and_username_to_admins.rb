class AddRecipesCountAndUsernameToAdmins < ActiveRecord::Migration[5.0]
  def change
    add_column :admins, :recipes_count, :integer, default: 0
    add_column :admins, :surname, :string
  end
end
