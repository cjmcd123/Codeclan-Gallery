require("sinatra")
require("sinatra/contrib/all")
require("pry-byebug")
require_relative("../models/artist")
require_relative("../models/category")
require_relative("../models/exhibit")
require_relative("../models/relation")
require_relative("../models/type")
also_reload("../models/*")

get '/admin/relations' do
  @relations = Relation.all()
  erb (:"relations/index")
end

get '/admin/relations/new' do
  @exhibits = Exhibit.all()
  @categories = Category.all()
  erb (:"relations/new")
end

get "/admin/relations/:id/edit" do
  @relation = Relation.find(params[:id].to_i)
  @exhibits = Exhibit.all()
  @categories = Category.all()
  erb(:"relations/edit")
end

post '/admin/relations' do
  @relation = Relation.new(params)
  @relation.save()
  erb(:"relations/create")
end

post "/admin/relations/:id" do
  @relation = Relation.new(params)
  @relation.update()
  erb(:"relations/update")
end

post "/admin/relations/:id/delete" do
  @relation = Relation.find(params[:id].to_i)
  @relation.delete()
  erb(:"relations/destroy")
end
