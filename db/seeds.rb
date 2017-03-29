User.create! name: "Example User",
  email: "example@railstutorial.org",
  password: "foobar",
  password_confirmation: "foobar",
  is_admin: true

20.times do |n|
  name  = Faker::Name.name
  name1 = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "asdasd"
  User.create! name: name,
    email: email, password: password,
    password_confirmation: password
  Author.create! name: name1,
    description: "Vo dich Nha Van"
end
