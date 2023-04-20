class DropTags < ActiveRecord::Migration[7.0]
  def up
    drop_table :tags
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
