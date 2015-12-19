class Api::V1::CategoriesController < Api::ApiController

	def index
		@categories = Category.all

		render json: @categories, each_serializer: CategorySerializer
	end

	def create
		@category = Category.create(category_params)

		if @category.save
			return render json: { message: "Created category" }, status: 201
		else
			return render json: {}, status: 422
		end
	end

	private 
		def category_params
			params.fetch(:category, {}).permit(:name)
		end
end
