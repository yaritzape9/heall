Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'volunteers#index'

  resources :girls, except: :index

  resources :volunteers

  resources :volunteers do
    resources :girls do
      resources :messages, only: [:index, :create]
    end
  end
  post '/languages', to: 'users#set_language', as: 'languages'
  mount ActionCable.server => '/cable'
  post '/new-heally', to: 'girls#new_heally'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  get 'logout'  => 'sessions#destroy'
end
