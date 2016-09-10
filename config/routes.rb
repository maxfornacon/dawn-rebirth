Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  get 'rooms/show'

  devise_for :users
	resources :users
  resources :pins do
    member do
      put "like" => "pins#upvote"
      put "unlike" => "pins#downvote"
    end
  end
  
  resources :friendships
  get 'friendships/create'
  get 'friendships/destroy'

  resources :guilds
  get 'join/:id', to: 'guilds#join', as:'join'
  get 'leave/:id', to: 'guilds#leave', as:'leave'
  get '/about/:id', to: "users#about", as: 'about'

  

	root "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
