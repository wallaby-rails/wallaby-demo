Rails.application.routes.draw do
  devise_for :users
  wallaby_mount at: '/admin'
  root to: redirect('/admin')
end
