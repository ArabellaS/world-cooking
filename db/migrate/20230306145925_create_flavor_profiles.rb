class CreateFlavorProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :flavor_profiles do |t|
      t.float :salty
      t.float :sweet
      t.float :umami
      t.float :sour
      t.float :spicy
      t.float :bitter
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
