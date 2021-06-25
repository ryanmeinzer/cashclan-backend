class Transaction < ApplicationRecord
    belongs_to :giver
    belongs_to :getter
end
