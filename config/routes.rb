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
  
  get "public/end_users" => "public/end_users#show"
  get "public/end_users/edit" => "public/end_users#edit"
  patch "public/end_users" => "public/end_users#update"
  get "public/end_users/withdrawal" => "public/end_users#withdrawal"
  delete "public/end_users" => "public/end_users#destroy"
end
