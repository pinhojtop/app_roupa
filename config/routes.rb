Rails.application.routes.draw do
  devise_for :users
  get 'pages/home'
  root to: 'offers#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :offers do # only: %i[index show new create edit delete]
    resources :rents, only: [:create]
  end

  resources :rents, only: i%[index show] do
     resources :reviews, only: [ :new, :create ]
  end

  resources :reviews, only: [:destroy]
  resources :rents, only: [:destroy]

  # resources :rents, only: [:index, :show] do
  #   resources :reviews, only: [:new, :create]
  # end

  get "my_offers", to: "offers#my_offers"
  get "my_rents", to: "rents#my_rents"
  get "my_rents/:id/reviews", to: "reviews#new", as: :new_rent_reviews
  post "my_rents/:id/reviews", to: "reviews#create", as: :rent_reviews

end
