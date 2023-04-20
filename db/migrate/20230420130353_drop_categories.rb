class DropCategories < ActiveRecord::Migration[7.0]
  def up
    drop_table :categories, force: :cascade
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
