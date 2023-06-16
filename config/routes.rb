Rails.application.routes.draw do
  resources :users, param: :name
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
  resources :houses, only: [:index, :create, :show, :destroy]
end
