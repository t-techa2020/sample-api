Rails.application.routes.draw do
  get 'swagger_ui/v1'
  get 'swagger_ui/v1_json'

  namespace :v1 do
    resources :todos, only: %i(index)
    resources :users, only:  %i(index)
  end
end
