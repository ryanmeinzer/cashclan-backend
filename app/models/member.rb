class Member < ApplicationRecord
    has_many :purchases, :class_name => 'Transaction', :foreign_key => 'buyer_id'
    has_many :sales, :class_name => 'Transaction', :foreign_key => 'seller_id'
end
