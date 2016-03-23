Rails.application.routes.draw do


  get 'likes/index'

  get "user/new" => "user#new"
  post "user" => "user#create"
  get "user/:id" => "user#show"
  patch 'user/:id' => 'user#update'
  get 'user/:id/edit' => 'user#edit'
  delete 'user/:id' => 'user#destroy'

  get "session/new" => "session#new"
  post "session" => "session#create"
  delete "session" => "session#destroy"
 
  get "secrets" => "secrets#index"
  post "secrets" => "secrets#create"
  delete "secrets/:id" => "secrets#destroy"

  post "likes" => "likes#create"
  delete "likes/:id" => "likes#destroy"
end
