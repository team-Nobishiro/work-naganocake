Rails.application.routes.draw do

  root 'public/homes#top'

  devise_for :master, controllers: {
    sessions: 'admin/masters/sessions'
  }

  devise_for :end_users, controllers: {
    :registrations => 'public/registrations',
    :passwords => 'public/passwords'
  }

  get "public/homes/about" => "public/homes#about"
  
  get "public/shipping_address" => "public/shipping_addresses#index"  
  




  namespace :public do
    resource :end_users
  end
  get "public/end_users/withdrawal" => "public/end_users#withdrawal"

end
