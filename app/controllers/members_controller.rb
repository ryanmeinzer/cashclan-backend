class MembersController < ApplicationController

    def index
        members = Member.all 
        render json: members
    end
    
    def create
        member = Member.find_or_create_by(googleId: params[:googleId]) do |member|
            member.name = params[:name]
            member.email = params[:email]
            member.image = params[:image]
            member.phone = params[:phone]
            member.active = params[:active]
            member.mode = params[:mode]
            member.amount = params[:amount]
            member.premium = params[:premium]
            member.location = params[:location]
        end
    end

    def update
        # ToDo - use member ID vs. googleId for more security
        member = Member.find_by(googleId: params[:id])
        member.update(member_params)
        # delete member's pending transaction(s) if they unpublish their offer
        if member.active == false
            Transaction.where(buyer_id: member.id, status: 'pending').or(Transaction.where(seller_id: member.id, status: 'pending')).destroy_all
        end
    end

    def show
        member = Member.find_by(googleId: params[:id])
        render json: member
    end

    private

    def member_params
        params.require(:member).permit(:googleId, :name, :email, :image, :phone, :active, :mode, :amount, :premium, :location)
    end

end
