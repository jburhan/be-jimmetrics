require 'faker'

5.times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "jimmetrics")
end

users = User.all

3.times do
  RegisteredApplication.create!(
    user: users.sample,
    name: Faker::Pokemon.name,
    url: "http://#{Faker::Pokemon.name}.com")
end

3.times do
  RegisteredApplication.create!(
    user: users.sample,
    name: Faker::LeagueOfLegends.champion,
    url: "http://#{Faker::LeagueOfLegends.champion}.com")
end

3.times do
  RegisteredApplication.create!(
    user: users.sample,
    name: Faker::HarryPotter.character,
    url: "http://#{Faker::HarryPotter.character}.com")
end

apps = RegisteredApplication.all


18.times do
  Event.create!(
    registered_application: apps.sample,
    name: "#{Faker::Hobbit.quote} at #{Faker::Hobbit.location}")
end

puts "Seeding finished"
puts "#{User.count} users created!"
puts "#{RegisteredApplication.count} applications created!"
puts "#{Event.count} events created!"
