Rails.application.routes.draw do
  root to: 'inicio#landing'

  get '/', to: 'inicio#landing'
  get 'mapa_liberal', to: 'inicio#mapa_liberal'
  get 'comunicacion', to: 'inicio#comunicacion'
  get 'unirme', to: 'usuarios#new'

  resources :usuarios, only: [:new, :create]
  resources :proyectos, only: [:index]
end
