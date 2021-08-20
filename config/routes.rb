Rails.application.routes.draw do
  # root to: redirect('/admin')

  devise_for :users
  wallaby_mount at: '/admin'

  resources :blogs
  resources :pages
  resources :products

  namespace :api do
    resources :blogs
  end
  # wallaby_mount at: '', as: :root_engine
end
