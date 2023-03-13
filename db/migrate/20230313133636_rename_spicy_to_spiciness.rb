class RenameSpicyToSpiciness < ActiveRecord::Migration[7.0]
    def change
      rename_column :flavor_profiles, :spicy, :spiciness
    end
end
