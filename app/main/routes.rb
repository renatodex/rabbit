ApplicationRouter.define do |route|
  route.component :main

  # To create a route, use the following sintax:
  # route.get '/myroute', [:controller_name, :action_name]
  #
  # Example:
  # route.get '/users/:id', [:users, :show]
  # route.post '/users', [:users, :create]
  #
  # You can also specify the root action, ex:
  # route.get '/', [:home, :index]
	route.get '/index', [:home,:index]
end
