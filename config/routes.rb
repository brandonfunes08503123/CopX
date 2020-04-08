Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    resources :users, only: [:show, :create]

    resource :session, only: [:create, :destroy]

    resources :sneakers, only: [:show, :index] do
      resources :listingitems, only: [:index]
    end
    # get "/sneakers/brands", to: "anime#brands"

    resources :listingitems, only: [:show, :destroy]

    resources :follows, only: [:create, :destroy]
  end

  root to: 'static_pages#root'
end
