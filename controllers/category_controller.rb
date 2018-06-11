require("sinatra")
require("sinatra/contrib/all")
require("pry-byebug")
require_relative("../models/artist")
require_relative("../models/category")
require_relative("../models/exhibit")
require_relative("../models/relation")
require_relative("../models/type")
also_reload("../models/*")

get '/categories' do
  @categories = Category.all()
  erb (:"categories/index_visitor")
end

get '/admin/categories' do
  @category = Category.all()
  erb (:"categories/index")
end

get '/admin/categories/new' do
  erb (:"categories/new")
end

get "/admin/category/:id/edit" do
  @category = Category.find(params[:id].to_i)
  erb(:"categories/edit")
end

post '/admin/category' do
  @category = Category.new(params)
  @category.save()
  erb(:"categories/create")
end

post "/admin/category/:id" do
  @category = Category.new(params)
  @category.update()
  erb(:"categories/update")
end

post "/admin/artists/:id/delete" do
  @category = Category.find(params[:id].to_i)
  @category.delete()
  erb(:"categories/destroy")
end
