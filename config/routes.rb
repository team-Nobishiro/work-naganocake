Rails.application.routes.draw do

  root 'public/homes#top'

  devise_for :master, controllers: {
    sessions: 'admin/masters/sessions'
  }

  devise_for :end_users, controllers: {
    :registrations => 'public/registrations'
  }

	get "public/homes/about" => "public/homes#about"
	get "public/shipping_address" => "public/shipping_addresses#index"  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
