require 'faker'

100.times do
  User.create!({
   email: Faker::Internet.free_email,
   password: Faker::Internet.password
  })
end

100.times do
  Wiki.create!({
    title: Faker::Lorem.unique.sentence,
    body: Faker::Lorem.unique.paragraph
  })
end
