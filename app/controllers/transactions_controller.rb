class TransactionsController < ApplicationController

    def index
        transactions = Transaction.all.order(created_at: :desc)
        render json: transactions
    end
    
    def create
        # ToDo - ensure members only ever have a single pending transaction

        pending_transaction = Transaction.find_by(buyer_id: params[:buyer_id], seller_id: params[:seller_id], status: 'pending', amount: params[:amount], premium: params[:premium], location: params[:location])
        if pending_transaction.exists?
            render json: pending_transaction
        else
            transaction = Transaction.create(transaction_params)
            render json: transaction
        end

        # Transaction.find_or_create_by(transaction_params)
        # transaction = Transaction.find_by(transaction_params)
        # render json: transaction

        # transaction = Transaction.find(params[:id])
        # if transaction.exists?
        #     render json: transaction
        # else
        #     transaction = Transaction.create(transaction_params)
        #     render json: transaction
        # end

        # if Transaction.where(:buyer_id => params[:buyer_id], :seller_id => params[:seller_id], :amount => params[:amount], status: 'pending').exists?
        #     transaction = Transaction.find_by(buyer_id: params[:buyer_id], seller_id: params[:seller_id], amount: params[:amount])
        #     transaction.update(seller_confirmed: true, buyer_confirmed: true, status: 'complete')
        #     # seller = Member.find_by(seller_id: params[:seller_id])
        #     # seller.update(active: false)
        #     # buyer = Member.find_by(buyer_id: params[:buyer_id])
        #     # buyer.update(active: false)
        # else
            # Transaction.create(transaction_params)
        # end
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
