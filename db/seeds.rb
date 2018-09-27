User.create!(name: "Phan Van Tan",
             email: "ptan94qn@gmail.com",
             password: "6chuso",
             password_confirmation: "6chuso",
             role: 1,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               role: 0,
               activated: true,
               activated_at: Time.zone.now)
end
