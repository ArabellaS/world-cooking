class CreateQuantities < ActiveRecord::Migration[7.0]
  def change
    create_table :quantities do |t|
      t.float :amount
      t.string :unit
      t.references :ingredient, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
