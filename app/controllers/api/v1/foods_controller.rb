class Api::V1::FoodsController < Api::ApiController

	def index
		@foods = Food.all

		render json: @foods, each_serializer: FoodSerializer
	end

	def create
		@food = Food.create(food_params)

		if @food.save
			return render json: @food, serializer: FoodSerializer, status: 201
		else
			return render json: {}, status: 422
		end
	end

	def show
		@food = Food.find_by(id: params[:id])

		render json: @food, root: false, serializer: FoodSerializer
	end

	def update
		@food = Food.find_by(id: params[:id])
		
		if @food.update_columns(food_params)
			return render json: @food, serializer: FoodSerializer, root: false, status: 200
		else
			return render_invalid_params
		end
	end

	def destroy
		@food = Food.find_by(id: params[:id])

		if @food.destroy
			render json: {}, status: 204
		else
			render json: {}, status: 422 
		end
	end

	private 
		def food_params
			params.permit(:name, :expiration_date, :brand, :quantity, :weight, 
				:category_id)	
		end

end
