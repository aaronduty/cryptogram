Rails.application.routes.draw do
  # api endpoints
  namespace :api do
    get '/cryptograms(/:identifier)', to: 'cryptogram#show', as: 'cryptograms'
    post '/cryptograms/check', to: 'cryptogram#check'
  end

  root "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
