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

  namespace :admin do
    resources :end_users
    resources :items
    resources :genres, except: [:show, :destroy]
  end



	get "public/homes/about" => "public/homes#about"
	get "public/shipping_address" => "public/shipping_addresses#index"  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :public do
    resource :end_users
    resources :shipping_addresses, except: [:new, :show]
    resources :items, only: [:index, :show]
    resources :genres, only: [:show]
  end
  get "public/end_users/withdrawal" => "public/end_users#withdrawal"
  put "public/end_users/hide" => "public/end_users#hide", as: 'users_hide'
end
