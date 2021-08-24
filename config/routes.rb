Rails.application.routes.draw do
  resources :orders
  resources :customers
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/' => 'hello#index'

  get '/hello' => 'hello#world'
end
