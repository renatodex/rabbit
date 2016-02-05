ApplicationRouter.define do |route|
  route.component :shopping

  route.get '/xungalunga', [:shopping,:showcase]
  route.get '/zika', [:shopping, :index]
end
