class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.text :content
      t.references :place, foreign_key: true

      t.timestamps
    end
  end
end
