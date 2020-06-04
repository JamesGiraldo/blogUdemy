Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "articles/search"
  root 'articles#index'
  get 'welcome/contactos'
  resources :articles
  resources :categories
end
