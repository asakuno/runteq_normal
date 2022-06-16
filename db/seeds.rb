10.times do
  User.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      password: 'aaa',
      password_confirmation: 'aaa'
  )
end

20.times do |index|
  Board.create(
      user: User.offset(rand(User.count)).first,
      title: "タイトル#{index}",
      body: "本文#{index}"
  )
end