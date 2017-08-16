Rails.application.routes.draw do
  resources :animes do
    member do
      put :change
    end
  end
  mount ActionCable.server => '/cable'
  match 'users/:id/destroy' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
  devise_for :users
	resources :users, except: [:create, :new, :destroy] do
    get :rank_up, on: :member
    get :rank_down, on: :member
    get :kick, on: :member
    get :make_mod, on: :member
    get :undo_mod, on: :member
  end
  get '/about/:id', to: "users#about", as: 'about'
  get '/anime_kanban/:id', to: "users#anime_kanban", as: 'anime_kanban'

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

  resources :msgs
  get 'chat', to: 'msgs#index'

  resources :messages

  resources :posts

  resources :updates

  resources :personal_messages, only: [:new, :create]
  resources :conversations, only: [:index, :show]

	root "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
