Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
    root to: 'pages#index'

    devise_scope :user do
      get '/users/sign_out' => 'devise/sessions#destroy'
    end

    resources :posts, only: %i(new create index) do
      resources :comments, only: [:create, :destroy]
      resources :like, only: %i(create destroy)
      resources :photos, only: %i(create)
    end
    get '/users/:id', to: 'users#show', as: 'user'
end