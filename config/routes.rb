Rails.application.routes.draw do
  get 'doses/new'
  get 'pages/index'
  root to: 'cocktails#index'
  resources :cocktails, only: [:index, :show, :new, :create] do
    resources :doses, only: [:new, :create]
  end
end
