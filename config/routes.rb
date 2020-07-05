Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'public/homes#top'

  devise_for :master, controllers: {
    sessions: 'admin/masters/sessions'
  }

  devise_for :end_users, controllers: {
    :registrations => 'public/registrations'
  }

	get "public/homes/about" => "public/homes#about"

	namespace :public do
	  resources :shipping_addresses, except: [:new, :show]
	end

	namespace :admin do
	  resources :items
	end

end
