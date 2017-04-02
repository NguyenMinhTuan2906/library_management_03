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
  "tinh cam": "Yeu duong suot muot",
  "Khoa hoc cong nghe": "The gioi cong nghe",
  "Thieu Nhi": "The loai thieu nhi"
  }

Categories.each do |k,v|
  Category.create! name: "#{k}", description: "#{v}"
end

20.times do |n|
  name = Faker::Name.name
  name1 = Faker::Name.name
  name2 = Faker::Name.name
  name3 = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "asdasd"
  User.create! name: name,
    email: email, password: password,
    password_confirmation: password
  Author.create! name: name1,
    description: "Best Author of Years"
  Publisher.create! name: name2,
    description: "Best Publisher of Years",
    address: "#{rand(0..99)} Ha Noi"
end

users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each{ |followed| user.follow(followed) }
followers.each{ |follower| follower.follow(user) }
