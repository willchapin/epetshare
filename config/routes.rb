Epetshare::Application.routes.draw do
  root :to => 'static_pages#index'
  
  match 'sign_in' => 'sessions#create'

  resources :user

end
