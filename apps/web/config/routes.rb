# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
root to: 'home#index'

post '/request', to: 'request#create', as: :request

get '/prices', to: 'prices#index', as: :prices

get '/gallery', to: 'gallery#index', as: :gallery
get '/about_me', to: 'about_me#index'
