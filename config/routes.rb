Rails.application.routes.draw do
  get '/search', to: 'pages#search'
  root 'pages#home'
end
