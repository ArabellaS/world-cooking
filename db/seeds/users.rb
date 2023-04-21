FlavorProfile.destroy_all# if Rails.env.development?
User.destroy_all# if Rails.env.development?

User.create!(
  name: "alexis",
  password: "azerty",
  email: "alexis@test.fr"
)

User.create!(
  name: "cecile",
  password: "azerty",
  email: "cecile@test.fr"
)

User.create!(
  name: "ouss",
  password: "azerty",
  email: "ouss@test.fr"
)
