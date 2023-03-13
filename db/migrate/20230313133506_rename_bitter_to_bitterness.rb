class RenameBitterToBitterness < ActiveRecord::Migration[7.0]
    def change
      rename_column :flavor_profiles, :bitter, :bitterness
    end
end
