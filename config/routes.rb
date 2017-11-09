Rails.application.routes.draw do
  root to: 'inicio#landing'

  get 'inicio/landing'
  get 'inicio/mapa_liberal'
end
