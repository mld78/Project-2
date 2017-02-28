Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root 'couplets#index'

  get '/couplets' => 'couplets#index'
  post '/couplets' => 'couplets#create'
  get '/couplets/new' => 'couplets#new', as: :new_couplet
    get '/couplets/:id' => 'couplets#show', as: :couplet
    get '/couplets/:id/edit' => 'couplets#edit', as: :edit_couplet
    patch '/couplets/:id' => 'couplets#update'
    delete '/couplets/:id' => 'couplets#destroy'
end
