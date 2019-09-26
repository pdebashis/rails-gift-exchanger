Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :exchanges
  root 'application#home'

  get '/contact', to: 'application#contact'
  get "/terms_of_use", to: "application#terms_of_use"
end
