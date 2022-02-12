class TransactionsController < ApplicationController

    def index
        transactions = Transaction.all.order(created_at: :desc)
        render json: transactions
    end
    
    # ToDo - find or create a transaction (vs. just create)
    def create
        # transaction = Transaction.create(transaction_params)

        # find or create where the user's last transaction isn't completed and their match is equal to their params match

        # the below works, but doesn't update the db as it finds the current transaction
        # transaction = Transaction.where(:buyer_id => params[:buyer_id], :seller_id => params[:seller_id], :amount => params[:amount]).first_or_create(transaction_params)

        transaction = Transaction.where(:buyer_id => params[:buyer_id], :seller_id => params[:seller_id], :amount => params[:amount]).first_or_create do |transaction|
            transaction.amount: params[:amount]
            transaction.premium: params[:premium]
            transaction.cost: params[:cost]
            transaction.profit: params[:profit]
            transaction.savings: params[:savings]
            transaction.buyer_offer_amount: params[:buyer_offer_amount]
            transaction.buyer_offer_premium: params[:buyer_offer_premium]
            transaction.seller_offer_amount: params[:seller_offer_amount]
            transaction.seller_offer_premium: params[:seller_offer_premium]
            transaction.seller_id: params[:seller_id]
            transaction.buyer_id: params[:buyer_id]
            # seller_confirmed: params[:seller_confirmed] ? params[:seller_confirmed] : false
            # buyer_confirmed: params[:buyer_confirmed] ? params[:buyer_confirmed] : false
            # status: seller_confirmed && buyer_confirmed ? 'complete' : 'pending'
            transaction.seller_confirmed: params[:seller_confirmed]
            transaction.buyer_confirmed: params[:buyer_confirmed]
            transaction.status: params[:status]
            transaction.location: params[:location]

        # @member_last_transaction = Transaction.find(params[:member_id]).transactions.last
        # @transaction = Transaction.where(member_id: params[:seller_id || :buyer_id])
        # transaction = Transaction.find_or_create_by(params[:id]) do |member|

        end


    end

    def update
        transaction = Transaction.find(params[:id])
        transaction.update(transaction_params)
        # render json: transaction
    end

    def show
        transaction = Transaction.find(params[:id])
        render json: transaction.seller.name
        # render json: transaction
    end

    private

    def transaction_params
        params.require(:transaction).permit(:seller_id, :buyer_id, :seller_confirmed, :buyer_confirmed, :status, :amount, :premium, :location, :cost, :profit, :savings, :buyer_offer_amount, :buyer_offer_premium, :seller_offer_amount, :seller_offer_premium)
    end

end
