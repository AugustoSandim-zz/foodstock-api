Rails.application.routes.draw do

	scope module: :api do
		namespace :v1, defaults: { format: :json } do
			
			resources :categories, only: [:index, :create]
			resources :categories, only: [:index, :create]

		end
	end

end