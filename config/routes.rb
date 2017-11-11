Rails.application.routes.draw do
  root to: 'inicio#landing'

  get '/', to: 'inicio#landing'
  get 'mapa_liberal', to: 'inicio#mapa_liberal'
end
