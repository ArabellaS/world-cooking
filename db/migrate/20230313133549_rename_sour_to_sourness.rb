class RenameSourToSourness < ActiveRecord::Migration[7.0]
    def change
      rename_column :flavor_profiles, :sour, :sourness
    end
end
