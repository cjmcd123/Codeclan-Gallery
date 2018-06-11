require("sinatra")
require("sinatra/contrib/all")
require("pry-byebug")
require_relative("../models/artist")
require_relative("../models/category")
require_relative("../models/exhibit")
require_relative("../models/relation")
require_relative("../models/type")
also_reload("../models/*")

get '/artists' do
  @artists = Artist.all()
  erb (:"artists/index_visitor")
end

get '/artists/:id' do
  @artist = Artist.find(params['id'].to_i)
  erb(:"artists/show_visitor")
end
