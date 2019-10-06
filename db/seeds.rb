10.times do
  User.create!(first_name:  Faker::Name.first_name,
               last_name: Faker::Name.last_name,
               email:  Faker::Internet.email,
               password:               "password",
               password_confirmation:  "password"
  )
end
50.times do
  Board.create!(title: Faker::Lorem.sentence(3),
                body: Faker::Lorem.sentence(5),
                user_id: User.all.sample.id
  )
end