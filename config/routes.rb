Rails.application.routes.draw do
  #resources :users
  #resources :prizes
  resources :events

  post '/login',    to: 'users#authenticate'
  post '/register', to: 'users#register'
  get  '/myuser',   to: 'users#myuser'

  post '/events/:event_id/subscribe',  to: 'participations#create'
  get  '/events/:id/get_participants', to: 'events#get_participants'
  post '/events/:event_id/prize',      to: 'prizes#create'
  get  '/events/:id/get_prizes',       to: 'events#get_prizes'

  post '/question1',                   to: 'question#question1'
  get  '/users/find_18y_or_developer', to: 'users#find_18y_or_developer'
end