class HerosController < ApplicationController

    def create
        person = Hero.create(hero_params)

        if person.valid?
            render json: person, status: 200
        else
            render json: {errors: "Failed"}
        end
    end

    def index
        render json: Hero.all, status: 200
    end

    private

    def hero_params
        params.permit(
            :name,
            :super_name
        )
    end
end
