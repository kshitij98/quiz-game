Rails.application.routes.draw do
  resources :subgenres
  resources :genres
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
	devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
