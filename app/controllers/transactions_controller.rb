class TransactionsController < ApplicationController

    def index
        transactions = Transaction.all.order(created_at: :desc)
        render json: transactions
    end
    
    def create
        # if Transaction.where(:buyer_id => params[:buyer_id], :seller_id => params[:seller_id], :amount => params[:amount], status: 'pending').exists?
        #     transaction = Transaction.find_by(buyer_id: params[:buyer_id], seller_id: params[:seller_id], amount: params[:amount])
        #     transaction.update(seller_confirmed: true, buyer_confirmed: true, status: 'complete')
        # else
        #     Transaction.create(transaction_params)
        # end
        Transaction.create(transaction_params)
    end

    # def update
    #     transaction = Transaction.find(params[:id])
    #     # render json: transaction
    # end

    def show
        transaction = Transaction.find(params[:id])
        render json: transaction
        # render json: transaction.seller.name
    end

    private

    def transaction_params
        params.require(:transaction).permit(:seller_id, :buyer_id, :seller_confirmed, :buyer_confirmed, :status, :amount, :premium, :location, :cost, :profit, :savings, :buyer_offer_amount, :buyer_offer_premium, :seller_offer_amount, :seller_offer_premium)
    end

end
