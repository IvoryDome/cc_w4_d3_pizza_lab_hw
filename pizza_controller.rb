require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/pizza_order')

#index
get '/pizza_orders' do
  @orders = PizzaOrder.all()
  erb(:index)
end

#new
get '/pizza_orders/new' do
  erb(:new)
end

#show
get '/pizza_orders/:id' do
  @order = PizzaOrder.find(params[:id].to_i)
  erb(:show)
end

post '/pizza_orders/:id' do
  @order = PizzaOrder.new(params)
  @order.update()
  erb(:update)
end

get '/pizza_orders/:id/edit' do
  @order = PizzaOrder.find(params[:id].to_i)
  erb(:edit)
end

#delete
post '/pizza_orders/:id/delete' do
  @order = PizzaOrder.find(params[:id].to_i)
  @order.delete
  erb(:delete)
end

#create
post '/pizza_orders' do
  @order = PizzaOrder.new(params)
  @order.save()
  erb(:create)
end
