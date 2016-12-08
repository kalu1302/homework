Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resource :session
  shallow do
    resources :bands do
      resources :albums, only: [:new, :index] do
        resources :tracks, only: [:new, :index]
      end
    end
  end
end
