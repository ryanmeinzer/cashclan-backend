class GettersController < ApplicationController

    def index
        getters = Getter.all 
        render json: getters
    end

    def create
        getter = Getter.create(getter_params)
        # render json: getter
    end

    def update
        getter = Getter.find(params[:id])
        getter.update(getter_params)
        # render json: getter
    end

    private

    def getter_params
        params.require(:getter).permit(:name, :phone, :venmo, :location, :amount)
    end

end
