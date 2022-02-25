class TransactionsController < ApplicationController

    def index
        transactions = Transaction.all.order(created_at: :desc)
        render json: transactions
    end
    
    def create
        # ensure new transaction is created only if it's a new transaction (also handled on FE) and only if both parties do not have a pending transaction
        pending_identical_transaction = Transaction.find_by(buyer_id: params[:buyer_id], seller_id: params[:seller_id], status: 'pending', amount: params[:amount], premium: params[:premium], location: params[:location])
        pending_transaction = Transaction.where(buyer_id: params[:buyer_id], status: 'pending').or(Transaction.where(seller_id: params[:buyer_id], status: 'pending'))
        if !pending_identical_transaction.present? and !pending_transaction.present?
            transaction = Transaction.create(transaction_params)
            render json: transaction
        end
    end

    def update
        transaction = Transaction.find(params[:id])
        transaction.update(transaction_params)

        buyer = Member.find(params[:buyer_id])
        seller = Member.find(params[:seller_id])
        buyer.update(active: false, mode: '', amount: 10, premium: 1, location: '')
        seller.update(active: false, mode: '', amount: 10, premium: 1, location: '')
    end

    def show
        transaction = Transaction.find(params[:id])
        render json: transaction
        # render json: transaction.seller.name
    end

    def destroy
        transaction = Transaction.find(params[:id])
        transaction.destroy
        render json: transaction
    end

    private

    def transaction_params
        params.require(:transaction).permit(:seller_id, :buyer_id, :seller_confirmed, :buyer_confirmed, :status, :amount, :premium, :location, :cost, :profit, :savings, :buyer_offer_amount, :buyer_offer_premium, :seller_offer_amount, :seller_offer_premium)
    end

end
