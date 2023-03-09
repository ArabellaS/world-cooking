require "faker"

10.times do
  Place.create!(
    city: Faker::Address.city,
    region: "Occitanie",
    country: Faker::Address.country
  )
end

