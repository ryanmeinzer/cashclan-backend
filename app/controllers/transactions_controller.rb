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
        params.require(:transaction).permit(:giver_id, :getter_id, :giver_confirmed, :getter_confirmed, :status, :amount, :location)
    end

end
