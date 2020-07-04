Rails.application.routes.draw do
	root 'homes#top'
	devise_for :master, controllers: {
  sessions: 'masters/sessions',
  yus: 'masters/yus'
}
devise_for :end_user
	get "home/about" => "homes#about"
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'home/about'
end
