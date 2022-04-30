require_relative 'controllers/users_controller'
require_relative 'controllers/my_app'

map '/users' do
  run UsersController
end

map '/' do
  run MyApp
end
