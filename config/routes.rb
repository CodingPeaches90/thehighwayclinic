Rails.application.routes.draw do
  resources :profiles
  resources :patients
  devise_for :users
  # get 'landingpage/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # Default rooting on page load
  root 'landingpage#index'
  get '/signedinuserprofile' => 'profiles#signedinuserprofile'
  get '/profiles/:id', to: 'profiles#show', as: 'profile_user'
end
