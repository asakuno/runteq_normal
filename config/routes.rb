Rails.application.routes.draw do
  namespace :admin do
    root 'dashboards#index', as: :root
    get 'login', to: 'user_sessions#new'
    post 'login', to: 'user_sessions#create'
    delete 'logout', to: 'user_sessions#destroy'
    resources :users, only: %w[index show edit update destroy]
    resources :boards, only: %w[index show edit update destroy]
  end
  root 'static_pages#top'
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  resources :password_resets, only: %i[create edit update new]
  resources :users, only: %w[new create]
  resource :profile, only: %w[show edit update]
  resources :boards do
    resources :comments, only: %i[edit create update destroy], shallow: true
    get :bookmarks, on: :collection
  end
  resources :bookmarks, only: %w[create destroy]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
