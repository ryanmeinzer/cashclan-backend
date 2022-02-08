class TransactionsController < ApplicationController

    def index
        transactions = Transaction.all 
        render json: transactions
    end
    
    # ToDo - find or create a transaction (vs. just create)
    def create
        transaction = Transaction.create(transaction_params)
        # render json: transaction
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
