Rails.application.routes.draw do

  root  to: 'static_pages#home'
  get  'static_pages/help', to: 'static_pages#help', as: 'help'
  get  'static_pages/about',to: 'static_pages#about', as: 'about'
  get 'static_pages/contact', to: 'static_pages#contact', as: 'contact'
  

  get 'signup' => 'users#new'
  resources :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end


