Rails.application.routes.draw do
  root 'archived_websites#index'
  get 'search', to: 'archived_websites#search'
  post 'archived_websites', to: 'archived_websites#create'
end