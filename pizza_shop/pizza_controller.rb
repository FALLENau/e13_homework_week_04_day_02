require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( 'models/pizza' )

# INDEX
get '/pizzas' do
  @pizzas = Pizza.all()
  erb(:index)
end

# NEW
get '/pizzas/new' do
  erb(:new)
end
# EDIT
get "/pizzas/:id/edit" do
  @pizza = Pizza.find(params["id"].to_i)
  erb(:edit)
end

# SHOW
get '/pizzas/:id' do
  @pizza = Pizza.find(params["id"].to_i())
  erb(:show)
end

# CREATE
post "/pizzas" do
  @pizza = Pizza.new(params)
  @pizza.save()
  erb(:create)
end

# UPDATE
post "/pizzas/:id/update" do
  @pizza = Pizza.new(params)
  @pizza.update()
  erb(:update)
end

# DELETE
post "/pizzas/:id/delete" do
  @pizza = Pizza.find(params["id"].to_i())
  @pizza.delete()
  erb(:delete)
end
