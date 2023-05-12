class RenameQuantitiesToRecipeElements < ActiveRecord::Migration[7.0]
  def change
    rename_table :quantities, :recipe_elements
  end
end
