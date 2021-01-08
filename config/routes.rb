Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  get 'recipes/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "recipes#index"
  resources :recipes do
    resources :comments
    resources :likes
    collection do
      get 'search'
    end
  end
  resources :users, only: :show
end
