Rails.application.routes.draw do
  devise_for :users
  mount Wallaby::Engine => "/admin"
  root to: redirect('/admin')
end
