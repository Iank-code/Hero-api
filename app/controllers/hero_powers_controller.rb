class HeroPowersController < ApplicationController
    def create
        item = HeroPower.create(hero_power_params)
        if item.valid?
            render json: item.hero, include: ["powers"]
            # app_response(status: :created, data: item.hero)
        else
            app_response(status: :unprocessable_entity, data: item.errors, message: 'failed')
        end
    end

    def index
        all = HeroPower.all
        app_response(message: "Success", data: all)
    end

    private

    def hero_power_params
        params.permit(:strength, :power_id, :hero_id)
    end
end
