Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  devise_for :users
	resources :users, except: [:create, :new, :destroy]
  get '/about/:id', to: "users#about", as: 'about'
  
  resources :pins do
    member do
      put "like" => "pins#upvote"
      put "unlike" => "pins#downvote"
      post 'flag'
    end
  end

  resources :friendships, except: [:index, :new, :edit, :show, :update]
  get 'friendships/create'
  get 'friendships/destroy'

  resources :guilds
  get 'join/:id', to: 'guilds#join', as:'join'
  get 'leave/:id', to: 'guilds#leave', as:'leave'

  get 'guilds/chat/:id', to: 'guilds#chat', as: 'guilds_chat'
  get 'guilds/members/:id', to: 'guilds#members', as: 'guilds_members'

  get 'admin/users'
  get 'admin/index'
  get 'admin/flags'

	root "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
