class CampersController < ApplicationController

    # moved to app controller
# rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
# rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_response

    def index
        render json: Camper.all
    end

    def show
        camper = find_campers
        render json: camper, serializer: ShowCamperSerializer
        # don't put colon before the serializer name
        # caps all the words in serializer

    end

    def create
        camper = Camper.create!(camper_params)
        render json: camper, status: 201
    end

    private

    def find_campers
        Camper.find(params[:id])
    end

    def camper_params
        params.permit(:name, :age)
    end

    # moved to app controller

    # def render_not_found_response
    #     render json: { error: "Camper not found"}
    # end

    # moved to app controller

    # def render_invalid_response(exception)
    #     render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    # end
    # def set_campers
        
    # end

end
