User.create!(name: "Phan Van Tan",
             email: "ptan94qn@gmail.com",
             password: "6chuso",
             password_confirmation: "6chuso",
             role: 1,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name: "tandeptrai",
            email: "tandeptrai@gmail.com",
            password: "123456",
            password_confirmation: "123456",
            role: 0,
            activated: true,
            activated_at: Time.zone.now)
