require 'faker'

100.times do
  User.create!({
   user: Faker::Name.unique.name
  })
end

100.times do
  Wiki.create!({
    title: Faker::Lorem.unique.sentence,
    body: Faker::Lorem.unique.paragraph
  })
end
