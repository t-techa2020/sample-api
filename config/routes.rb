Rails.application.routes.draw do
  namespace :v1 do
    resources :todos, only: %i(index)
    resources :users, only:  %i(index)
  end
end
