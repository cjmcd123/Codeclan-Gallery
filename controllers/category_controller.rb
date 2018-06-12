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

get '/admin/categories/new' do
  erb (:"categories/new")
end

get '/admin/categories/:id/add' do
  @exhibit = Exhibit.find(params[:id].to_i)
  @categories = Category.all()
  erb(:"categories/add")
end

get '/admin/categories/:id/modify' do
  @categories = Category.all()
  @relations = Relation.find_all(params[:id].to_i)
  @exhibit = Exhibit.find(params[:id].to_i)
  erb(:"categories/modify")
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

post '/admin/categories/:id/add' do
  # binding.pry
  @exhibit = Exhibit.find(params[:id].to_i)
  # @relations = params[check_list].map {|relation| Relation.new(relation)}
  @relations = []
for item in params[:check_list]
  @relations << Relation.new({"exhibit_id" => @exhibit.id, "category_id" => item})
end
  for relation in @relations
    relation.save()
  end
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
