class Api::V1::CategoriesController < Api::ApiController

	def index
		@categories = Category.all

		respond_with @categories, root: false
	end

	def create
		@category = Category.create(category_params)
	end

	private 
		def category_params
			params.fetch(:category, {}).permit(:name)
		end
end
