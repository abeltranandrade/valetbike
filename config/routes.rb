Rails.application.routes.draw do
  root "home#index"
  devise_for :users, module: "users"
  resources :stations

  get 'home'    => 'home#index'
  get 'about'    => 'about#index'
  get 'help'    => 'help#index'

  get 'home/map' => 'home#map'
  get 'memberships'  => 'memberships#index'

  get 'billing' => 'billing#show'
  get 'checkout/success' => 'checkout#success'
  get 'checkout/:id' => 'checkout#show', as: "checkout"
end
