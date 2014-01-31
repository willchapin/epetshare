# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



User.destroy_all

puts "creating users..."

100.times do
    User.create(firstname: Faker::Name.first_name,
                lastname: Faker::Name.last_name,
                email: Faker::Internet.free_email,
                password: "password")
end

puts "users have been created!"

puts "creating pets..."

User.all.each do |user|
  [1,2,3].sample.times do
    user.pets.create(name: Faker::Name.first_name,
                     species: ["cat", "dog"].sample)
    
  end
end

puts "pets have been created!"

puts "creating locations..."

User.all.each do |user|
  until user.location && user.location.valid?
    user.build_location(address: Faker::Address.street_address,
                        city: Faker::Address.city,
                        state: Faker::Address.state,
                        zip: Faker::Address.zip_code)
  end
  user.location.save
end

puts "locations have been created!"
