class Member < ApplicationRecord
    has_many :sellers 
    has_many :buyers
    has_many :transactions, through: :sellers
    has_many :transactions, through: :buyers
end
