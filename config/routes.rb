Rails.application.routes.draw do
  get 'pages/index'
  root to: 'cocktails#index'
  resources :cocktails, only: [:index, :show, :new, :create]
end
