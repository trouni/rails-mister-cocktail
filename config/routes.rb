Rails.application.routes.draw do
  root to: 'pages#home'
  get 'search', to: 'pages#search', as: :search
  resources :cocktails, only: [:index, :show, :new, :create] do
    collection do
    end
    resources :doses, only: [:new, :create]
  end
  resources :doses, only: :destroy
end
