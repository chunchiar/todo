Rails.application.routes.draw do

    namespace :api do
      namespace :v1 do
        resources :sessions, :users
        resources :tasks do
          resources :complete, only: [:create]
        end
      end
    end

end
