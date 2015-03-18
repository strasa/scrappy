Rails.application.routes.draw do

  devise_for :users

  authenticated :user do
    root to: 'welcome#main', as: :main
  end

  unauthenticated :user do
    root to: 'welcome#index'
  end

end
