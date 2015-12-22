Rails.application.routes.draw do

	scope module: :api do
		namespace :v1, defaults: { format: :json } do
			
			resources :categories, only: [:index, :create]
			resources :foods, only: [:index, :create, :show, :destroy]

		end
	end

end