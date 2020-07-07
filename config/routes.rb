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
    resources :genres, except: [:new, :show, :destroy]
    resources :orders, only: [:index, :show, :update]
    resources :item_orders, only: [:update]
  end

	get "public/homes/about" => "public/homes#about"
	get "public/shipping_address" => "public/shipping_addresses#index"  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :public do
    resource :end_users
    resources :shipping_addresses, except: [:new, :show]
    resources :items, only: [:index, :show]
    resources :genres, only: [:show]
    resources :orders, expect: [:edit, :update, :destroy]
    resources :cart_items
    resources :orders
  end

  delete "public/cart_items" => "public/cart_items#destroy_all"

  get "public/orders/:id/confirm" => "public/orders#confirm", as: 'order_confirm'

  get "public/end_users/withdrawal" => "public/end_users#withdrawal"
  put "public/end_users/hide" => "public/end_users#hide", as: 'users_hide'
  

end

