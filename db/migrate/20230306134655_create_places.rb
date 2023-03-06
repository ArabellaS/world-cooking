class CreatePlaces < ActiveRecord::Migration[7.0]
  def change
    create_table :places do |t|
      t.float :lat
      t.float :lng
      t.string :city
      t.string :region
      t.string :country

      t.timestamps
    end
  end
end
