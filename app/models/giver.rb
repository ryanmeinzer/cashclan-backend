class Giver < ApplicationRecord
    has_many :transactions
    has_many :getters, through: :transactions
end
