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

  mount ActionCable.server => '/cable'

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#delete', as: 'logout'
end
