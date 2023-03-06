class CreateUtensils < ActiveRecord::Migration[7.0]
  def change
    create_table :utensils do |t|
      t.string :name

      t.timestamps
    end
  end
end
