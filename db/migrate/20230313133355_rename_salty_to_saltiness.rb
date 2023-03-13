class RenameSaltyToSaltiness < ActiveRecord::Migration[7.0]
    def change
      rename_column :flavor_profiles, :salty, :saltiness
    end
end
