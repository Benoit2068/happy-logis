Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    root to: "devise/sessions#new"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/my_deliveries', to: 'deliveries#my_deliveries'
  resources :deliveries do
    resources :loadings, only: [:new, :create, :show] do
      member do
        post 'toggle'
      end
    end
  end

  resources :loadings, only: [:destroy] do
    resources :loadingmaterials, only: :create do
      resources :materials
    end
  end
end
