User.create! name: "Example User",
  email: "example@railstutorial.org",
  password: "foobar",
  password_confirmation: "foobar",
  is_admin: true

Categories = {
  "kinh di": "So hai ghe gom",
  "vien tuong": "Hu cau",
  "trinh tham": "Ki bi li ky",
  "hai huoc": "Buon cuoi",
  "tinh cam": "Yeu duong suot muot"
  }

Categories.each do |k,v|
  Category.create! name: "#{k}", description: "#{v}"
end

20.times do |n|
  name = Faker::Name.name
  name1 = Faker::Name.name
  name2 = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "asdasd"
  User.create! name: name,
    email: email, password: password,
    password_confirmation: password
  Author.create! name: name1,
    description: "Vo dich Nha Van"
  Publisher.create! name: name2,
    description: "Khung Bo Cao Hieu",
    address: "#{rand(0..99)} Ha Noi"
end
