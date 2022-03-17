Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :deliveries do
    resources :loadings do
      resources :materials, only: :create
    end
  end
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
