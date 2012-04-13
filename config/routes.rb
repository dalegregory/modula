Modula::Application.routes.draw do

  post '/store' => 'orders#create'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users

  root to: 'welcome#index'

end
