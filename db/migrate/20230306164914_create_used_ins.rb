class CreateUsedIns < ActiveRecord::Migration[7.0]
  def change
    create_table :used_ins do |t|
      t.references :place, null: false, foreign_key: true
      t.references :usable, polymorphic: true

      t.timestamps
    end
  end
end
