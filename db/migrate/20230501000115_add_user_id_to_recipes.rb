class AddUserIdToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :user, :string
  end
end
