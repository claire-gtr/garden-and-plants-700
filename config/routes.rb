Rails.application.routes.draw do
  resources :gardens do
    resources :plants, only: [:create, :new] #/gardens/:garden_id
  end
  resources :plants, only: :destroy
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
