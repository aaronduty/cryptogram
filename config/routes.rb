Rails.application.routes.draw do
  # api endpoints
  get '/cryptogram', to: 'cryptogram#show'
  post '/cryptogram/check', to: 'cryptogram#check'

  root "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
