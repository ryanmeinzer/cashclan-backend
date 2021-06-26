class Seller < ApplicationRecord
    belongs_to :member
    has_many :transactions
end
