Rails.application.routes.draw do
  root to: 'inicio#landing'

  get '/', to: 'inicio#landing'
  get 'mapa_liberal', to: 'inicio#mapa_liberal'
  get 'comunicacion', to: 'inicio#comunicacion'
  get 'principios', to: 'inicio#principios'
  get 'unirme', to: 'usuarios#new'
  get 'preguntas_frecuentes', to: 'inicio#preguntas_frecuentes'

  post 'sesion/iniciar'
  get 'sesion/cerrar'

  resources :usuarios, only: [:index, :new, :create, :edit, :update] do
    collection do
      post 'send_reset_password_by_email'
      get 'reset_password_by_email'
      post 'reset_password_with_token'
    end
  end
  resources :proyectos, only: [:index]
end
