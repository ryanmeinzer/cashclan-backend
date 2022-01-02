class MembersController < ApplicationController

    def index
        members = Member.all 
        render json: members
    end

    # for sessions (incomplete)
    # def new
    #     if session[:member_id]
    #         member = Member.find(session[:member_id])
    #     end
    # end
    
    def create
        # member = Member.create(member_params)

        member = Member.find_or_create_by(googleId: params[:googleId]) do |member|
            member.name = params[:name]
            member.email = params[:email]
            member.image = params[:image]
            member.phone = params[:phone]
            member.venmo = params[:venmo]
            member.active = params[:active]
            member.mode = params[:mode]
            member.amount = params[:amount]
            member.premium = params[:premium]
            member.location = params[:location]
        end

        # for sessions (incomplete)
        # session[:member_id] = member.id

        # render 'members/new'
    end

    def update
        # member = Member.find(params[:id])

        # could use below, but it is unsecure
        member = Member.find_by(googleId: params[:id])
        member.update(member_params)
    end

    def show
        # member = Member.find(params[:id])

        member = Member.find_by(googleId: params[:id])
        render json: member
    end

    private

    def member_params
        params.require(:member).permit(:googleId, :name, :email, :image, :phone, :venmo, :active, :mode, :amount, :premium, :location, :meeting, :outfitTop, :outfitBottom, :outfitShoes)
    end

end
