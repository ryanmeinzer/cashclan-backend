# no need to include below as Heroku handles with secured config vars
# require '.env'
require 'rubygems'
require 'twilio-ruby'

class TransactionsController < ApplicationController

    def index
        transactions = Transaction.all.order(created_at: :desc)
        render json: transactions.to_json({
            except: [:created_at, :updated_at]
        })
    end
    
    def create
        # ensure new transaction is created only if it's a new transaction (also handled on FE) and only if both parties do not have a pending transaction
        pending_identical_transaction = Transaction.find_by(buyer_id: params[:buyer_id], seller_id: params[:seller_id], status: 'pending', amount: params[:amount], premium: params[:premium], location: params[:location])
        pending_transaction = Transaction.where(buyer_id: params[:buyer_id], status: 'pending').or(Transaction.where(seller_id: params[:buyer_id], status: 'pending')).or(Transaction.where(buyer_id: params[:seller_id], status: 'pending')).or(Transaction.where(seller_id: params[:seller_id], status: 'pending'))
        if !pending_identical_transaction.present? and !pending_transaction.present?

            transaction = Transaction.create(transaction_params)

            buyer_phone = Member.find(params[:buyer_id]).phone
            seller_phone = Member.find(params[:seller_id]).phone
            buyer_name = Member.find(params[:buyer_id]).name
            seller_name = Member.find(params[:seller_id]).name
            account_sid = ENV['TWILIO_ACCOUNT_SID']
            auth_token = ENV['TWILIO_AUTH_TOKEN']
            twilio_number = ENV['TWILIO_NUMBER']
            # test_number = ENV['TEST_NUMBER']
            
            # send buyer an SMS reminder if they have a phone, rescuing exception to continue execution if Twilio API call fails
            begin
                if buyer_phone.present?
                    client = Twilio::REST::Client.new(account_sid, auth_token)
                        client.messages.create(
                            body: "You've been matched at #{params[:location]} with #{seller_name}! Meet now at the ATM. For transaction specifics (or to cancel), login at https://cashclan.com.",
                            from: twilio_number,
                            to: "+#{buyer_phone}"
                        )
                end
            rescue => e
                puts e
            end

            begin
                # send seller an SMS reminder if they have a phone, rescuing exception to continue execution if Twilio API call fails
                if seller_phone.present?
                    client.messages.create(
                    body: "You've been matched at #{params[:location]} with #{buyer_name}! Meet now at the ATM. For transaction specifics (or to cancel), login at https://cashclan.com.",
                    from: twilio_number,
                    to: "+#{seller_phone}"
                    )
                end
            rescue => e
                puts e
            end

            render json: transaction.to_json({
                except: [:created_at, :updated_at]
            })
        end
    end

    def update
        pending_identical_transaction = Transaction.find_by(buyer_id: params[:buyer_id], seller_id: params[:seller_id], status: 'pending', amount: params[:amount], premium: params[:premium], location: params[:location])

        pending_identical_transaction.update(transaction_params)

        buyer = Member.find(params[:buyer_id])
        seller = Member.find(params[:seller_id])
        buyer.update(active: false, mode: '', amount: 60, premium: 5, location: '')
        seller.update(active: false, mode: '', amount: 60, premium: 5, location: '')

        render json: pending_identical_transaction.to_json({
            except: [:created_at, :updated_at]
        })
    end

    def show
        transaction = Transaction.find(params[:id])
        render json: transaction.to_json({
            except: [:created_at, :updated_at]
        })
    end

    def destroy
        transaction = Transaction.find(params[:id])
        transaction.destroy
        render json: transaction.to_json({
            except: [:created_at, :updated_at]
        })
    end

    private

    def transaction_params
        params.require(:transaction).permit(:seller_id, :buyer_id, :seller_confirmed, :buyer_confirmed, :status, :amount, :premium, :location, :cost, :profit, :savings, :buyer_offer_amount, :buyer_offer_premium, :seller_offer_amount, :seller_offer_premium)
    end

end
