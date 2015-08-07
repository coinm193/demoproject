User.create!(name:  "Example User",
             email: "e@e.c",
             password:              "123456",
             password_confirmation: "123456",
             admin: true)

49.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
50.times do
  title = Faker::Lorem.sentence(5)
  body = Faker::Lorem.sentence(15)
  users.each { |user| user.entries.create!(title: title, body: body) }
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
