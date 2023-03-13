class RenameSweetToSweetness < ActiveRecord::Migration[7.0]
    def change
      rename_column :flavor_profiles, :sweet, :sweetness
    end
end
