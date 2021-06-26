# Generator Setups

rails g resource Member name:string phone:integer venmo:string selling:boolean buying: boolean

rails g resource Transaction seller_confirmed:boolean buyer_confirmed:boolean status:string amount:integer location:string

# AR Relationships

# Member

has_many :transactions, through: :sellers
has_many :transactions, through: :buyers

# Seller

belongs_to :member
has_many :transactions

# Buyer

belongs_to :member
has_many :transactions

# Transaction

belongs_to :seller
belongs_to :buyer