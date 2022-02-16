require 'faker'

Member.destroy_all
Transaction.destroy_all

30.times do
    Member.create(name: Faker::Name.unique.name, image: Faker::LoremFlickr.image(size: "100x100"), phone: Faker::Number.number(digits: 10), active: rand(2) == 1, mode: ['buying', 'selling'].sample, amount: Faker::Number.between(from: 10, to: 300), premium: Faker::Number.between(from: 1, to: 10), location: ["McTeague's Saloon", 'Teeth', 'Noc Noc'].sample)
end

30.times do
    Transaction.create(seller_id: Member.all.sample.id, buyer_id: Member.all.sample.id, seller_confirmed: rand(2) == 1, buyer_confirmed: rand(2) == 1, status: ['complete', 'pending'].sample, amount: Faker::Number.between(from: 1, to: 300), premium: Faker::Number.between(from: 1, to: 10), location: ["McTeague's Saloon", 'Teeth', 'Noc Noc'].sample)
end