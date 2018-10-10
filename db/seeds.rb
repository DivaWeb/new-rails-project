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

admin = User.create!(
  email:    'admin@example.com',
  password: 'helloworld',
  password_confirmation: 'helloworld',
  role:     'admin'
)
 # Create premium user
premium = User.create!(
  email:    'member@example.com',
  password: 'helloworld',
  password_confirmation: 'helloworld',
  role:     'premium'
)

standard = User.create!(
  email:    'user@example.com',
  password: 'helloworld',
  password_confirmation: 'helloworld',
  role:     'standard'
)
users = User.all

5.times do
  Wiki.create!(
    user:     users.sample,
    title:    'Private - ' + Faker::Lorem.sentence,
    body:     Faker::Lorem.paragraph,
    private:  true
  )
end

puts "Seed finished"
puts "#{User.count} users created"
 puts "#{Wiki.count} wikis created"
