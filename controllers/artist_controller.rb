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

get '/admin/artists' do
  @artists = Artist.all()
  erb (:"artists/index")
end

get '/admin/artists/new' do
  erb (:"artists/new")
end

get '/admin/artists/:id' do
  @artist = Artist.find(params['id'].to_i)
  erb(:"artists/show")
end

get "/admin/artists/:id/edit" do
  @artist = Artist.find(params[:id].to_i)
  erb(:"artists/edit")
end

post '/admin/artists' do
  @artist = Artist.new(params)
  @artist.save()
  erb(:"artists/create")
end

post "/admin/artists/:id" do
  @artist = Artist.new(params)
  @artist.update()
  erb(:"artists/update")
end

post "/admin/artists/:id/delete" do
  @artist = Artist.find(params[:id].to_i)
  @artist.delete()
  erb(:"artists/destroy")
end
