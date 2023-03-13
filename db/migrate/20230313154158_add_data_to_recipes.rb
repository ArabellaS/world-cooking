class AddDataToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :sourness, :float
    add_column :recipes, :spiciness, :float
    add_column :recipes, :saltiness, :float
    add_column :recipes, :savoriness, :float
    add_column :recipes, :sweetness, :float
    add_column :recipes, :bitterness, :float
    add_column :recipes, :fattiness, :float
  end
end
