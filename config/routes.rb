Rails.application.routes.draw do
	root 'public/homes#top'
	devise_for :master, controllers: {
  sessions: 'masters/sessions',
  yus: 'masters/yus'
}
devise_for :end_user
	get "public/homes/about" => "public/homes#about"
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
