require("sinatra")
require("sinatra/contrib/all")
require("pry-byebug")
require_relative("../models/artist")
require_relative("../models/category")
require_relative("../models/exhibit")
require_relative("../models/relation")
require_relative("../models/type")
also_reload("../models/*")

get '/types' do
  @types = Type.all()
  erb (:"types/index_visitor")
end

get '/admin/types' do
  @types = Type.all()
  erb (:"types/index")
end

get '/admin/types/new' do
  erb (:"types/new")
end

get "/admin/types/:id/edit" do
  @type = Type.find(params[:id].to_i)
  erb(:"types/edit")
end

post '/admin/types' do
  @type = Type.new(params)
  @type.save()
  erb(:"types/create")
end

post "/admin/types/:id" do
  @type = Type.new(params)
  @type.update()
  erb(:"types/update")
end

post "/admin/types/:id/delete" do
  @type = Type.find(params[:id].to_i)
  @type.delete()
  erb(:"types/destroy")
end
