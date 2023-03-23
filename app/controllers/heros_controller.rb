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
        render json: Hero.all, status: 200, except: [:created_at, :updated_at]
    end

    def show
        hero = Hero.find(params[:id])

        if hero
            render json: hero, status: 200, serializer: HeroPowerSerializer

        else
            render json: {errors: "Hero not found"}, status: :not_found
        end
    end

    private

    def hero_params
        params.permit(
            :name,
            :super_name
        )
    end
end
