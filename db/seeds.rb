# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

100.times do
  user = User.create!(email: Faker::Internet.email, name: Faker::Name.name, password: '123456')
  puts "ユーザー作成: #{user.name}さんを作成中"
  comunity = Community.last
  comunity.community_participants.create!(community_id: comunity.id, user_id: user.id, admin: false)
end