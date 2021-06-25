# Generator Setups

rails g resource Giver name:string phone:integer venmo:string location:string amount:decimal

rails g resource Getter name:string phone:integer venmo:string location:string amount:decimal

rails g resource Transaction giver_id:integer getter_id:integer giver_confirmed:boolean getter_confirmed:boolean status:string amount:decimal location:string

# AR Relationships

# Giver

has_many :transactions
has_many :getters, through: :transactions

# Getter

has_many :transactions
has_many :givers, through: :transactions

# Transaction

belongs_to :giver
belongs_to :getter