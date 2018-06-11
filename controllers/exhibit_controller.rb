require("sinatra")
require("sinatra/contrib/all")
require("pry-byebug")
require_relative("./models/artist")
require_relative("./models/category")
require_relative("./models/exhibit")
require_relative("./models/relation")
require_relative("./models/type")
also_reload("./models/*")

get '/exhibits' do
  @exhibits = Exhibit.all()
  erb (:"exhibits/index_visitor")
end

get '/exhibits/:id' do
  @exhibits = Exhibit.find(params['id'].to_i)
  erb(:"exhibits/show_visitor")
end
