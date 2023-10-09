Rails.application.routes.draw do
  root 'archived_websites#index'

  get 'search', to: 'archived_websites#search'
  post 'create', to: 'archived_websites#create'
end