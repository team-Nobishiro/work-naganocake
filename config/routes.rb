Rails.application.routes.draw do
  devise_for :masters
  devise_for :end_users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
