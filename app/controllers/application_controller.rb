class ApplicationController < ActionController::API
  include ActionController::Cookies

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity


  def render_not_found_response(exception)
    render json: { error: exception}, status: 404
  end

  def render_unprocessable_entity(exception)
    render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  end

end
