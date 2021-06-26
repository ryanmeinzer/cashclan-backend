# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Member.destroy_all
Seller.destroy_all
Buyer.destroy_all

10.times do
    Member.create(name: Faker::Name.unique.name, phone: Faker::Number.number(digits: 10), venmo: Faker::Internet.username, selling: rand(2) == 1, buying: rand(2) == 1)
end

Seller.create(member_id: Member.all.first.id, location: '37.794374248633815, -122.400108679331', amount: Faker::Number.between(from: 1, to: 100))

Seller.create(member_id: Member.all.second.id, location: '37.794374248633815, -122.400108679331', amount: Faker::Number.between(from: 1, to: 100))

Seller.create(member_id: Member.all.third.id, location: '37.794374248633815, -122.400108679331', amount: Faker::Number.between(from: 1, to: 100))

Buyer.create(member_id: Member.all[9].id, location: '37.794374248633815, -122.400108679331', amount: Faker::Number.between(from: 1, to: 100))

Buyer.create(member_id: Member.all[8].id, location: '37.794374248633815, -122.400108679331', amount: Faker::Number.between(from: 1, to: 100))

Buyer.create(member_id: Member.all[7].id, location: '37.794374248633815, -122.400108679331', amount: Faker::Number.between(from: 1, to: 100))

20.times do
    Transaction.create(seller_id: Seller.all.sample.id, buyer_id: Buyer.all.sample.id, seller_confirmed: rand(2) == 1, buyer_confirmed: rand(2) == 1, status: 'pending', amount: Faker::Number.between(from: 1, to: 100), location: '37.794374248633815, -122.400108679331')
end