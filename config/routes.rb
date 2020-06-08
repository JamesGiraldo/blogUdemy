Rails.application.routes.draw do
  get "articles/search"
  devise_for :users
  resources :articles do
    resources :comments
  end
  resources :categories
  post "contacts/new"
  get 'welcome/contactos'
  resources :contacts, only: [:create, :new]
  root 'articles#index'
end
