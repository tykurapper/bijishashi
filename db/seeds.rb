puts "Start seed DB"
User.create!(fullname:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             )

User.create!(fullname:  "NamDepTrai vd",
             email: "nam@gmail.com",
             password:              "123456",
             password_confirmation: "123456",
             )

puts "create 20 user "
20.times do |n|
  name  = Faker::Name.name
  email = Faker::Internet.email
  password = "password"
  User.create!(fullname:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               )
end


# Following relationships
users = User.all
user  = users.first
following = users[2..10]
followers = users[3..15]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

puts "Finish"