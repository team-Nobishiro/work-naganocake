Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'public/homes#top'

  devise_for :master, controllers: {
    sessions: 'admin/masters/sessions'
  }

  devise_for :end_users, controllers: {
    :registrations => 'public/registrations',
    :passwords => 'public/passwords',
    :sessions => 'public/sessions'
  }


  get "public/homes/about" => "public/homes#about"
  
  get "public/shipping_address" => "public/shipping_addresses#index"  
  




  namespace :public do
    resource :end_users
  end
  get "public/end_users/withdrawal" => "public/end_users#withdrawal"
  put "public/end_users/hide" => "public/end_users#hide", as: 'users_hide'



	namespace :public do
	  resources :shipping_addresses, except: [:new, :show]
	end

	namespace :admin do
	  resources :items
	end


end
