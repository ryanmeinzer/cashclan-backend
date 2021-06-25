class Getter < ApplicationRecord
    has_many :transactions
    has_many :givers, through: :transactions
end
