class RenameUmamiToSavoriness < ActiveRecord::Migration[7.0]
  def change
    rename_column :flavor_profiles, :umami, :savoriness
  end
end
