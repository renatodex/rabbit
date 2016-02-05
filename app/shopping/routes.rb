ApplicationRouter.define do |route|
  route.component :shopping

  route.get '/roupa-basica/:product_name', [:product, :index]
end
