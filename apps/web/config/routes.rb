# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
root to: 'home#index'

post '/request', to: 'request#create', as: :request

# get '*slug', to: 'page#show', as: :pageget '/prices', to: 'prices#index'
