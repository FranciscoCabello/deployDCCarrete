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
    resources :comunas
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
    resources :comunas
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '', to: 'pages#home', as: 'home'
  get 'profile/user', to: 'pages#show', as: 'user_profile'
  post 'carretes/inscribirse'
  post 'comentariocarretes/create'
  post 'comentarioservicios/create'
  get 'pages/admin'
  post 'carretes/aprobar'
  post 'servicios/aprobar'
  post 'carretes/agregar_servicio'
  post 'carretes/agregar_servicio_def'
  post 'carretes/ingresar_apuesta'
end
