Rails.application.routes.draw do
  root "houses#index"

  resources :houses, only: [:new, :create, :index, :show] do
    resources :members, only: [:new, :create, :index]
  end

  resources :members
end
