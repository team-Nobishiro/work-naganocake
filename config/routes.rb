Rails.application.routes.draw do
	root 'public/homes#top'
	devise_for :master, controllers: {
  sessions: 'admin/masters/sessions'
}
devise_for :end_user, controllers: {
  sessions: 'public/end_users/sessions',
  registrations: 'public/end_users/registrations'
}

	get "public/homes/about" => "public/homes#about"
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
