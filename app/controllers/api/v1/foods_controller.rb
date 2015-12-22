class Api::V1::FoodsController < Api::ApiController

	def index
		@foods = Food.all

		render json: @foods, each_serializer: FoodSerializer
	end

end
