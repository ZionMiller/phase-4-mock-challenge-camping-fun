class ActivitiesController < ApplicationController

# rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

    def index
        render json: Activity.all
    end

    def destroy
        activity_params.destroy
        head :no_content, status: :no_content
    end

    private

    def activity_params
        Activity.find(params[:id])
    end

    # def render_not_found
    #     render json: { error: "Activity not found" }
    # end

end
