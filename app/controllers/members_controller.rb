class MembersController < ApplicationController

    def index
        members = Member.all 
        render json: members
    end
    
    def create
        member = Member.create(member_params)
        # render json: member
    end

    def update
        member = Member.find(params[:id])
        member.update(member_params)
        # render json: member
    end

    private

    def member_params
        params.require(:member).permit(:name, :phone, :venmo, :selling, :buying, :amount, :location)
    end

end
