Rails.application.routes.draw do
  root to: 'pages#home'
  get 'search', to: 'pages#search', as: :search
  resources :cocktails, only: [:index, :show, :new, :create, :update] do
    collection do
      post 'autogenerate', to: 'cocktails#autogenerate', as: :autogenerate
    end
    resources :doses, only: [:new, :create]
  end
  resources :doses, only: :destroy
  resources :ingredients, only: [:index, :show]
end
