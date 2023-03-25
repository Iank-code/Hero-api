class HerosController < ApplicationController

    def create
        person = Hero.create(hero_params)

        if person.valid?
            app_response(status: :created, data: person)
        else
            app_response(status: :unprocessable_entity, data: person.errors, message: 'failed')
        end
    end

    def index
        render json: Hero.all, status: 200, except: [:created_at, :updated_at]
    end

    def show
        hero = Hero.find(params[:id])
# include: ["powers"]
        if hero
            render json: hero, status: 200,serializer: HeroPowerConnectSerializer , except: [:created_at, :updated_at]
        else
            render json: {errors: "Hero not found"}, status: :not_found
        end
    end

    def destroy
        hero = Hero.find(params[:id])
        if hero
            hero.destroy
            head :no_content
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
