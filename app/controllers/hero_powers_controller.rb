class HeroPowersController < ApplicationController
    def create
        item = HeroPower.create(hero_power_params)
        if item.valid?
            render json: item, status: created
        else
            render json: {errors: "Failed"}
        end
    end

    def index
        render json: HeroPower.all, status: :ok
    end

    private

    def hero_power_params
        params.permit(:strength, :power_id, :power_id, :hero_id)
    end
end
