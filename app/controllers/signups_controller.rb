class SignupsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :render_unproccessed_entity_response

  def create
    sign_up = Signup.create!(sign_up_params)
    render json: sign_up.activity, status: :created
  end

  private

  def sign_up_params
    params.permit(:time, :camper_id, :activity_id)
  end

  def render_unproccessed_entity_response(error)
    render json: { errors: error.record.errors.full_messages }, status: :unprocessable_entity
  end
end
