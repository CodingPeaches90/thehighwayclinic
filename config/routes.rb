Rails.application.routes.draw do
  devise_for :users
  # get 'landingpage/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # Default rooting on page load
  root 'landingpage#index'
end
