Rails.application.routes.draw do
  get 'bill_imports/new'

  resources :bill_imports
  resources :bills do
    collection do
      post :import
    end
  end

  resources :searches
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'welcome/index'

  devise_for :users, controllers: {
      sessions: 'users/sessions',
      passwords: 'users/passwords',
      registrations: 'users/registrations'
  }
  authenticated :user do
    root :to => 'bills#index', as: :authenticated_root
  end

  root :to => 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
