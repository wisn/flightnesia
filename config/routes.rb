Rails.application.routes.draw do
  resources :confirmations
  get '/planes/find', to: 'planes#find'
  post '/planes/find', to: 'planes#find'
  get '/planes/result', to: 'planes#result'
  resources :planes
  get '/bookings/new/:kode_pesawat', to: 'bookings#new_book'
  post '/bookings/new/:kode_pesawat', to: 'bookings#create_book'
  post '/bookings/confirm/:booking_id', to: 'bookings#confirm'
  get '/bookings/status', to: 'bookings#status'
  post '/bookings/check', to: 'bookings#check'
  resources :bookings
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'page#home'
  get '/contact', to: 'page#contact'
  get '/admin', to: 'users#login'
  post '/admin', to: 'users#auth'
  get '/logout', to: 'users#logout'
  get 'dashboard', to: 'users#dashboard'
end
