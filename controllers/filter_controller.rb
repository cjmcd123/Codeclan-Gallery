require("sinatra")
require("sinatra/contrib/all")
require("pry-byebug")
require_relative("../models/artist")
require_relative("../models/category")
require_relative("../models/exhibit")
require_relative("../models/relation")
require_relative("../models/type")
also_reload("../models/*")

get '/exhibits/artist/:id' do
  @exhibits = Exhibit.filter_by_artist(params['id'].to_i)
  @name = Artist.find(params['id'].to_i).name
  erb (:"filter/visitor_artist")
end

get '/exhibits/type/:id' do
  @exhibits = Exhibit.filter_by_type(params['id'].to_i)
  @type = Type.find(params['id'].to_i).type
  erb (:"filter/visitor_type")
end

get '/exhibits/category/:id' do
  @exhibits = Exhibit.filter_by_category(params['id'].to_i)
  @category = Category.find(params['id'].to_i).category
  erb (:"filter/visitor_cat")
end

get '/admin/exhibits/artist/:id' do
  @exhibits = Exhibit.filter_by_artist(params['id'].to_i)
  @name = Artist.find(params['id'].to_i).name
  erb (:"filter/admin_artist")
end

get 'admin/exhibits/type/:id' do
  @exhibits = Exhibit.filter_by_artist(params['id'].to_i)
  @type = Type.find(params['id'].to_i).type
  erb (:"filter/admin_type")
end

get 'admin/exhibits/category/:id' do
  @exhibits = Exhibit.filter_by_artist(params['id'].to_i)
  @category = Category.find(params['id'].to_i).category
  erb (:"filter/admin_cat")
end
