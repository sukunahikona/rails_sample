Rails.application.routes.draw do
  devise_for :admins # 追加
  devise_for :users # 追加
  resources :prefectures
  resources :calenders
  resources :rooms

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "rooms#index"
end
