Rails.application.routes.draw do
  devise_for :users
  get 'pages/home'
  root to: 'offers#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :offers # only: %i[index show new create edit delete]
end
