Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  patch '/usuarios/:id', to: 'usuarios#update', as: 'user'
  post '/usuarios/new', to: 'usuarios#create_personal', as: :create_personal
  post '/usuarios/new', to: 'usuarios#create_admin', as: :create_admin
  get '/usuarios/new/admin', to: 'usuarios#new_admin', as: :new_admin
  get '/usuarios/new/personal', to: 'usuarios#new_personal', as: :new_personal
  delete '/usuarios/:id/delete', to: 'usuarios#destroy', as: :destroy_usuario
  resources :usuarios


  get '/sucursals/new', to: 'sucursals#new', as: :new_sucursal
  post '/sucursals/new', to: 'sucursals#create'
  patch '/sucursals/:id/edit', to: 'sucursals#update'
  delete '/sucursals/:id', to: 'sucursals#destroy', as: :destroy_sucursal
  resources :sucursals



  get '/horarios/:id', to: 'horarios#new', as: :new_horario
  post '/horarios/new', to: 'horarios#create'
  get '/sucursals/:id_sucursal/horarios/:id', to: 'horarios#edit', as: :edit_horario
  patch '/horarios/:id', to: 'horarios#update'
  delete '/sucursal/:id_sucursal/horarios/:id', to: 'horarios#destroy', as: :destroy_horario
  resources :horarios

  get '/turnos/:id/show', to: 'turnos#show', as: :show_turno
  get '/turnos/:id', to: 'turnos#new', as: :new_turno
  post '/turnos/new', to: 'turnos#create'
  patch '/turnos/:id/edit', to: 'turnos#update'
  delete '/turnos/:id', to: 'turnos#destroy', as: :destroy_turno
  resources :turnos

  get '/comentarios/:id', to: 'comentarios#new', as: :new_comentario
  post '/comentarios/:id', to: 'comentarios#create'
  get '/comentario/:id', to: 'comentarios#show', as: :comentario


end
