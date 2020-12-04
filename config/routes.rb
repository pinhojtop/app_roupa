Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :offers do # only: %i[index show new create edit delete]
    resources :reviews, only: [ :new, :create ]
  end

  resources :reviews, only: [:destroy ]
end
