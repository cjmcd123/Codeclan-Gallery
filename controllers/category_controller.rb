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
  @categories = Category.all()
  erb (:"categories/index")
end

get '/admin/categories/add' do
  @categories = Category.all()
  erb(:"categories/add")
end

get '/admin/categories/modify' do
  @categories = Category.all()
  erb(:"category/modify")
end

get '/admin/categories/new' do
  erb (:"categories/new")
end

get "/admin/categories/:id/edit" do
  @category = Category.find(params[:id].to_i)
  erb(:"categories/edit")
end

post '/admin/categories' do
  @category = Category.new(params)
  @category.save()
  erb(:"categories/create")
end

post '/admin/categories/add' do
  @categories = params.map {|category| Category.new(category)}

  erb(:"categories/check")
end

post "/admin/categories/:id" do
  @category = Category.new(params)
  @category.update()
  erb(:"categories/update")
end

post "/admin/categories/:id/delete" do
  @category = Category.find(params[:id].to_i)
  @category.delete()
  erb(:"categories/destroy")
end
