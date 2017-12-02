# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
root to: 'home#index'

resources :sessions, only: [:new, :create]
resources :photos, only: [:index, :new, :create, :edit, :update, :destroy]
resources :prices, only: [:index, :new, :create, :edit, :update, :destroy]
