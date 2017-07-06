Rails.application.routes.draw do
	root "flights#index"
	resources :bookings, only: [:new, :create, :show]
	resources :passangers, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
