# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  devise_for :users

  root to: "restaurants#index"

  resources :restaurants do
    resources :reviews
  end

end
