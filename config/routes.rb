Rails.application.routes.draw do
  root 'static_pages#top'
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  resources :users, only: %w[new create]
  resources :boards do
    resources :comments, only: %i[edit create update destroy], shallow: true
    get :bookmarks, on: :collection
  end
  resources :bookmarks, only: %w[create destroy]
end
