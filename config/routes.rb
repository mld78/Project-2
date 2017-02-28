Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' } 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root 'couplets#index'

# routes for basic CRUD of a couplet:
  get '/couplets' => 'couplets#index'
  post '/couplets' => 'couplets#create'
  get '/couplets/new' => 'couplets#new', as: :new_couplet
  get '/couplets/:id/edit' => 'couplets#edit', as: :edit_couplet
    get '/couplets/:id' => 'couplets#show', as: :couplet
    patch '/couplets/:id' => 'couplets#update'
    delete '/couplets/:id' => 'couplets#destroy'
end
