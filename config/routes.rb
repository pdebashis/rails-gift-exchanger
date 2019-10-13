Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :subscribers

  root 'subscribers#new'

  get '/contact', to: 'application#contact'
  get "/terms_of_use", to: "application#terms_of_use"

end
