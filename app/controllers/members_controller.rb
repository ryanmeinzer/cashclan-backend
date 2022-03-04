require 'http'

class MembersController < ApplicationController

    def index
        members = Member.all 
        render json: members
    end
    
    def create

        # validate the google ID token
        tokenId = params[:tokenId]
        response = HTTP.post("https://oauth2.googleapis.com/tokeninfo?id_token=#{tokenId}")

        # if the token is valid, proceed to find or create member
        if response.parse["email_verified"] == "true"
            googleId = response.parse["sub"]
            name = response.parse["name"]
            email= response.parse["email"]
            imageUrl = response.parse["picture"]

            # member = Member.find_or_create_by(googleId: params[:googleId]) do |member|
            member = Member.find_or_create_by(googleId: googleId) do |member|
                member.name = name
                member.email = email
                member.image = imageUrl
                member.phone = params[:phone]
                member.active = params[:active]
                member.mode = params[:mode]
                member.amount = params[:amount]
                member.premium = params[:premium]
                member.location = params[:location]
            end
            # return the member for the FE to use for state
            render json: member
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
