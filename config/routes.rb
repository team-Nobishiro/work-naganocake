Rails.application.routes.draw do
	root 'public/homes#top'
	devise_for :master, controllers: {
  sessions: 'admin/masters/sessions'
  }
  devise_for :end_user
	get "public/homes/about" => "public/homes#about"
  
  # resources :public/end_users
  get "public/end_users/show" => "public/end_users#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
