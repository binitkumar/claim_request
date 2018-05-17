Rails.application.routes.draw do
  resources :photos, only: [:show] 
  resources :claims do
    member do
      get :render_image
    end
  end
  root to: 'claims#new'
  devise_for :users
end
