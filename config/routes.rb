Rails.application.routes.draw do
  devise_for :users
  #devise_scope :user do
   # root to: "devise/sessions#new"
  #end

  resources :deliveries do
    resources :loadings do
      resources :materials, only: :create
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/my_deliveries', to: 'deliveries#my_deliveries'
end
