require("sinatra")
require("sinatra/contrib/all")
require_relative("./controllers/artist_controller")
require_relative("./controllers/category_controller")
require_relative("./controllers/exhibit_controller")
require_relative("./controllers/type_controller")
require_relative("./controllers/relation_controller")
require_relative("./controllers/filter_controller")

get '/' do
  erb(:index)
end

get '/admin' do
  erb(:index_admin)
end
