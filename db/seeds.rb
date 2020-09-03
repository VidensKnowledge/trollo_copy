# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create(first_name: "Jeff", last_name: 'Wike', email:'text1234@test.com', password: '123456')

10.times do 
  u1.boards.create(
    name: Faker::Name.last_name
  )
end

10.times do
  u1.boards[1].lists.create(
   name: Faker::Quote.yoda
  )
end