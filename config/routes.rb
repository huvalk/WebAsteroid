Rails.application.routes.draw do
  root to: 'game#play'
  post 'game/record'
  get 'game/play'
  post 'game/play'
  resource :locale, shallow: true do
    resource :game
  end
  get 'users/create'
  get 'locale/lang'
  get 'game/lang'
  post 'game/lang'
  resources :users
  get 'session/login'
  post 'session/create'
  get 'session/create'
  get 'session/logout'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
