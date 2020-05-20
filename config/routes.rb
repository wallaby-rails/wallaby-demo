Rails.application.routes.draw do
  root to: redirect('/admin')

  devise_for :users
  wallaby_mount at: '/admin'

  resources :blogs
  resources :pages

  namespace :api do
    resources :blogs
  end
end
