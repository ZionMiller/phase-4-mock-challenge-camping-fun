class SignupsController < ApplicationController

# rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
# moved this to app controler

    def create
        signup = Signup.create!(signup_params)
        render json: signup.activity, status: :created
    end

    private

    def signup_params
        params.permit(:time, :camper_id, :activity_id)
    end

# moved this to app controller
    # def render_unprocessable_entity(exception)
    #     render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    # end

end
