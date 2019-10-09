Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :subscribers, only: [:new, :create, :destroy]

  get '/subscribers' => 'subscribers#new'

  root 'subscribers#new'

  get '/contact', to: 'application#contact'
  get "/terms_of_use", to: "application#terms_of_use"

end
