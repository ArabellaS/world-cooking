Place.destroy_all# if Rails.env.development?

Place.create!(
  city: "Nancy",
  region: "Lorraine",
  country: "France"
)

Place.create!(
  city: "Dijon",
  region: "Bourgogne",
  country: "France"
)

Place.create!(
  city: "Toulouse",
  region: "Occitanie",
  country: "France"
)

Place.create!(
  city: "Nice",
  region: "Côte d'Azur",
  country: "France"
)

Place.create!(
  city: "Paris",
  region: "Île-de-France",
  country: "France"
)