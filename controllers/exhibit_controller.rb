require("sinatra")
require("sinatra/contrib/all")
require("pry-byebug")
require_relative("../models/artist")
require_relative("../models/category")
require_relative("../models/exhibit")
require_relative("../models/relation")
require_relative("../models/type")
also_reload("../models/*")

get '/exhibits' do
  @exhibits = Exhibit.all()
  @artists = Artist.all()
  @types = Type.all()
  @categories = Category.all()
  erb (:"exhibits/index_visitor")
end

get '/exhibits/:id' do
  @exhibit = Exhibit.find(params['id'].to_i)
  erb(:"exhibits/show_visitor")
end

get '/admin/exhibits' do
  @exhibits = Exhibit.all()
  erb (:"exhibits/index")
end

get '/admin/exhibits/new' do
  @artists = Artist.all()
  @types = Type.all()
  erb (:"exhibits/new")
end

get '/admin/exhibits/:id' do
  @exhibit = Exhibit.find(params['id'].to_i)
  erb(:"exhibits/show")
end

get "/admin/exhibits/:id/edit" do
  @exhibit = Exhibit.find(params[:id].to_i)
  @artists = Artist.all()
  @types = Type.all()
  @category = Category.all()
  erb(:"exhibits/edit")
end

post '/admin/exhibits' do
  @exhibit = Exhibit.new(params)
  @exhibit.save()
  erb(:"exhibits/create")
end

post "/admin/exhibits/:id" do
  @exhibit = Exhibit.new(params)
  @exhibit.update()
  erb(:"exhibits/update")
end

post "/admin/exhibits/:id/delete" do
  @exhibit = Exhibit.find(params[:id].to_i)
  @exhibit.delete()
  erb(:"exhibits/destroy")
end
