# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Giver.destroy_all
Getter.destroy_all
Transaction.destroy_all

10.times do
    Giver.create(name: Faker::Name.unique.name, phone: Faker::Number.number(digits: 10), venmo: Faker::Internet.username, location: '37.794374248633815, -122.400108679331', amount: Faker::Number.between(from: 1, to: 100))
end

10.times do
    Getter.create(name: Faker::Name.unique.name, phone: Faker::Number.number(digits: 10), venmo: Faker::Internet.username, location: '37.794374248633815, -122.400108679331', amount: Faker::Number.between(from: 1, to: 100))
end

100.times do
    Transaction.create(giver_id: Giver.all.sample.id, getter_id: Getter.all.sample.id, giver_confirmed: true, getter_confirmed: true, status: 'complete', amount: Faker::Number.between(from: 1, to: 100), location: '37.794374248633815, -122.400108679331')
end