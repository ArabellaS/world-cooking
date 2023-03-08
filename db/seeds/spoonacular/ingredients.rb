require "csv"

Ingredient.destroy_all# if Rails.env.development?

csv_text = File.read(Rails.root.join('db', 'csv', 'top-1k-ingredients.csv'))

csv = CSV.parse(csv_text, :headers => false, :encoding => 'UTF-8')

csv.each do |row|
  Ingredient.create!(
    name: row[0]
  )
end
