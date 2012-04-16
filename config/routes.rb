Modula::Application.routes.draw do

  resources :orders, only: [:create, :show]

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users

  root to: 'welcome#index'

end
