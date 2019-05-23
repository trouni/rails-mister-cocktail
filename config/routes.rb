Rails.application.routes.draw do
  root to: 'cocktails#index'
  resources :cocktails, only: [:index, :show, :new, :create] do
    collection do
      get 'search', to: 'cocktails#search', as: :search
    end
    resources :doses, only: [:new, :create]
  end
  resources :doses, only: :destroy
end
