class Api::ApiController < ApplicationController
	protect_from_forgery with: :null_session

	respond_to :json

	def render_unauthorized
		render json: { message: "Unauthorized" }, status: 401
	end

	def render_invalid_params
		render json: { message: "Invalid params" }, status: 422
	end

	def render_not_found
		render json: { message: "Not found" }, status: 404
	end

end
