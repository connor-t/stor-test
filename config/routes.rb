Rails.application.routes.draw do
  root 'home#index'
  get 'search', to: 'home#search', as: 'search'
  resources :klines
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
