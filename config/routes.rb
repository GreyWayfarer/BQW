Rails.application.routes.draw do
  resources :records
  root to: "main#index"
  get 'hello/index'
  get "/", to: "main#index"

  get "add_record", to: "records#new"
  post "add_record", to: "records#create"

  get "records/:id", to: "records#show", as: :show
  post "records/:id", to: "records#destroy"

  get "update", to: "main#update"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
