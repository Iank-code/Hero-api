class PowersController < ApplicationController
    def create
        power = Power.create(power_params)

        if power.valid?
            render json: power, status: :created, except: [:created_at, :updated_at]

        else

            render json: {errors: "Failed to create powers"}
        end
    end


    def index
        render json: Power.all, status: :ok, except: [:created_at, :updated_at]
    end

    def show
        power = Power.find(params[:id])

        if power
            render json: power, status: 200, except: [:created_at, :updated_at]
        else
            render json: {errors: "Power not found"}, status: :not_found
        end
    end

    private

    def power_params
        params.permit(:name, :description)
    end
end
