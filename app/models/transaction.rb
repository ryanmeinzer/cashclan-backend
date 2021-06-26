class Transaction < ApplicationRecord
    belongs_to :buyer, :class_name => 'Member', :foreign_key => 'buyer_id'
    belongs_to :seller, :class_name => 'Member', :foreign_key => 'seller_id'
end