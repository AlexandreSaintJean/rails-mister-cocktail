Rails.application.routes.draw do

  mount Attachinary::Engine => "/attachinary"

  resources :doses, only: [:create, :destroy]

  resources :cocktails, only: [:index, :show, :new, :create]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
