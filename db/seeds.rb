require 'faker'

Member.destroy_all
Transaction.destroy_all

10.times do
    Member.create(name: Faker::Name.unique.name, phone: Faker::Number.number(digits: 10), venmo: Faker::Internet.username, active: rand(2) == 1, mode: ['buying', 'selling'].sample, amount: Faker::Number.between(from: 10, to: 300), premium: Faker::Number.between(from: 1, to: 100), location: ["McTeague's Saloon", 'Teeth', 'Noc Noc'].sample)
end

30.times do
    Transaction.create(seller_id: Member.all.sample.id, buyer_id: Member.all.sample.id, seller_confirmed: rand(2) == 1, buyer_confirmed: rand(2) == 1, status: 'pending', amount: Faker::Number.between(from: 1, to: 300), location: ["McTeague's Saloon", 'Teeth', 'Noc Noc'].sample)
end