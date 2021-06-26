require 'faker'

Member.destroy_all
Transaction.destroy_all

10.times do
    Member.create(name: Faker::Name.unique.name, phone: Faker::Number.number(digits: 10), venmo: Faker::Internet.username, selling: rand(2) == 1, buying: rand(2) == 1, amount: Faker::Number.between(from: 1, to: 100), location: '37.794374248633815, -122.400108679331')
end

30.times do
    Transaction.create(seller_id: Member.all.sample.id, buyer_id: Member.all.sample.id, seller_confirmed: rand(2) == 1, buyer_confirmed: rand(2) == 1, status: 'pending', amount: Faker::Number.between(from: 1, to: 100), location: '37.794374248633815, -122.400108679331')
end