Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :tasks, except: [:show, :new, :edit] do
        member do
          post 'move_task', to: 'tasks#move_task'
        end
      end
    end
  end
end
