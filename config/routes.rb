Rails.application.routes.draw do

  devise_for :users

  authenticated :user do
    root to: 'welcome#main', as: :main
    resources :materials, only: [:index, :update, :create]
    resources :projects, only: [:index, :update, :create]
  end

  unauthenticated :user do
    root to: 'welcome#index'
  end

end
