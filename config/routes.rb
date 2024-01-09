Rails.application.routes.draw do
  devise_for :users

  resources :posts, only: [:index, :show, :create, :new, :destroy] do
    resources :comments, only: [:create]
  end

  root 'posts#index'
end
  