class MembersController < ApplicationController

    def index
        members = Member.all 
        render json: members
    end
    
    def create
        # member = Member.create(member_params)
        member = Member.find_or_create_by(googleId: params[:googleId]) do |member|
            member.name = params[:name]
            member.email = params[:email]
            member.location = params[:location]
        end
    end

    def update
        member = Member.find(params[:id])
        member.update(member_params)
        # render json: member
    end

    private

    def member_params
        params.require(:member).permit(:googleId, :name, :email, :phone, :venmo, :selling, :buying, :amount, :location)
    end

end
