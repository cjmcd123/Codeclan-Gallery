require("sinatra")
require("sinatra/contrib/all")
require("pry-byebug")
require_relative("./models/artist")
require_relative("./models/category")
require_relative("./models/exhibit")
require_relative("./models/relation")
require_relative("./models/type")
also_reload("./models/*")

get '/types' do
  @types = Type.all()
  erb (:"types/index_visitor")
end

get '/types/:id' do
  @types = Type.find(params['id'].to_i)
  erb(:"types/show_visitor")
end
