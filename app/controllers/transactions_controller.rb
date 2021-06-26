class TransactionsController < ApplicationController

    def index
        transactions = Transaction.all 
        render json: transactions
    end
    
    def create
        transaction = Transaction.create(transaction_params)
        # render json: transaction
    end

    def update
        transaction = Transaction.find(params[:id])
        transaction.update(transaction_params)
        # render json: transaction
    end

    private

    def transaction_params
        params.require(:transaction).permit(:seller_id, :buyer_id, :seller_confirmed, :buyer_confirmed, :status, :amount, :location)
    end

end
