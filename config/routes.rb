Rails.application.routes.draw do
  get 'leaderboard/index'

  get 'question/index'
  post 'question/start_quiz'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'home#index'
  resources :subgenres
  resources :genres
	devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
