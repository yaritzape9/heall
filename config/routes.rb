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
  post '/new-heally', to: 'girls#new_heally'

  get 'conversation' => 'messages#fake_talk'
  post 'conversation' => 'messages#redirect_to_talk'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  get 'logout'  => 'sessions#destroy'
end
