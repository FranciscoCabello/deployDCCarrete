Rails.application.routes.draw do

  resources :comentarioservicios
  resources :comentariocarretes
  resources :servicios
  resources :carretesasistidos
  resources :servicioscreados
  resources :carretescreados
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
  }

  resources :carretes do
    resources :users
    resources :servicios
    resources :comentariocarretes
  end

  resources :users do
    resources :carretes
    resources :servicios
    resources :comentariocarretes
    resources :comentarioservicios
  end

  resources :servicios do
    resources :carretes
    resources :comentarioservicios
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '', to: 'pages#home', as: 'home'
  get 'profile/user', to: 'pages#show', as: 'user_profile'
  post 'carretes/inscribirse'
  post 'comentariocarretes/create'
  post 'comentarioservicios/create'


end
