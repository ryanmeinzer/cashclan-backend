class GiversController < ApplicationController

    def index
        givers = Giver.all 
        render json: givers
    end
    
    def create
        giver = Giver.create(giver_params)
        # render json: giver
    end

    def update
        giver = Giver.find(params[:id])
        giver.update(giver_params)
        # render json: giver
    end

    private

    def giver_params
        params.require(:giver).permit(:name, :phone, :venmo, :location, :amount)
    end

end
