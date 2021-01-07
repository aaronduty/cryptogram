Rails.application.routes.draw do
  get '/cryptogram', to: 'cryptogram#show'
  post '/cryptogram/check', to: 'cryptogram#check'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
