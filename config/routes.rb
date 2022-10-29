Rails.application.routes.draw do
  
  #NOTE: PUT ALL OF FILES IN ONE FOLDER, "HOME.INDEX.ERB, DONT NEED ALL THREE FILES"
  root "home#index"

  #pls delete once webpage is set
  match 'about', to: 'about#index', via: 'get'
  match 'home', to: 'home#index', via: 'get'
  match 'help', to: 'help#index', via: 'get'
  match 'rent', to: 'rent#index', via: 'get'

  #match '/map/:id', to: 'map#show', via: 'get'

  get 'home/index'
  get 'help/index'
  get 'login/index'
  get 'rent/index'

  #--------------------------------------
  resources :users, only: [:create]
  get 'login', to: 'users#login'


  #NEED MORE INFO ABOUT ACCOUNT AND LOGIN 
    
  # delete 'logout' => 'login#destroy'
  # resource :users, controller: 'users', only: [:new, :create, :destroy] do
  #   member do
  #     get :form
  #   end
  # end

end
  #--------------------------------------