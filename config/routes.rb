Rails.application.routes.draw do

  resources :exchanges do
    collection do
      get :match_making
    end

    resources :members do
      collection do
        get :confirm_membership
      end
    end
  end

  resources :subscribers, only: [:index, :new, :create, :show]

  patch 'subscribers/update'


  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "clearance/users", only: [:create, :show] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  resources :users, controller: "users", only: [:edit, :update], as: "user_profile"
  get "/users/:id/child_show" => "users#child_show", :as => 'child_show'


  constraints Clearance::Constraints::SignedOut.new do
    root 'subscribers#new'
  end

  constraints Clearance::Constraints::SignedIn.new do
    root 'exchanges#index', as: :signed_in_root
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  get "/session" => "clearance/sessions#new"

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'


  get '/contact', to: 'application#contact'
  get '/terms_of_use', to: 'application#terms_of_use'

end
