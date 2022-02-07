Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :drinks
			resources :products
			resources :foods
		end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	resources :sessions, only: [:create]
	resources :registrations, only: [:create]

	delete :logout, to: 'sessions#logout'
	get :logged_in, to: 'sessions#logged_in'

  root to: 'static#home'
end
