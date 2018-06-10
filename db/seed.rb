require_relative("../models/artist.rb")
require_relative("../models/type.rb")
require_relative("../models/category.rb")
require_relative("../models/exhibit.rb")
require_relative("../models/relation.rb")
require("pry-byebug")

Artist.delete_all()
Type.delete_all()
Category.delete_all()
Exhibit.delete_all()
Relation.delete_all()

artist1 = Artist.new({
  "name" => "Vincent van Gogh",
  "dob" => "1853-03-30"
  })
artist1.save()

artist2 = Artist.new({
  "name" => "Pablo Picasso",
  "dob" => "1881-10-25"
  })
artist2.save()

artist3 = Artist.new({
  "name" => "Leonardo da Vinci",
  "dob" => "1452-04-15"
  })
artist3.save()

artist4 = Artist.new({
  "name" => "Michelangelo",
  "dob" => "1475-03-06"
  })
artist4.save()

artist5 = Artist.new({
  "name" => "Jackson Pollock",
  "dob" => "1912-01-28"
  })
artist5.save()

type1 = Type.new ({
  "type" => "painting"
  })
type1.save()

type2 = Type.new ({
  "type" => "sketch"
  })
type2.save()

type3 = Type.new ({
  "type" => "statue"
  })
type3.save()

type4 = Type.new ({
  "type" => "book"
  })
type4.save()

category1 = Category.new({
  "category" => "modern art"
  })
category1.save()

category2 = Category.new({
  "category" => "abstract impressionism"
  })
category2.save()

category3 = Category.new({
  "category" => "post impressionism"
  })
category3.save()

category4 = Category.new({
  "category" => "cubism"
  })
category4.save()

category5 = Category.new({
  "category" => "portrait"
  })
category5.save()

category6 = Category.new({
  "category" => "self portrait"
  })
category6.save()

category7 = Category.new({
  "category" => "landscape"
  })
category7.save()

category8 = Category.new({
  "category" => "expressionism"
  })
category8.save()

category9 = Category.new({
  "category" => "codex"
  })
category9.save()

category10 = Category.new({
  "category" => "study"
  })
category10.save()

category11 = Category.new({
  "category" => "renaissance"
  })
category11.save()

category12 = Category.new({
  "category" => "preperation sketch"
  })
category12.save()

category13 = Category.new({
  "category" => "christian"
  })
category13.save()

category14 = Category.new({
  "category" => "classical mythology"
  })
category14.save()

exhibit1 = Exhibit.new({
  "title" => "Autumn Rhythm",
  "year" => 1950,
  "artist_id" => artist5.id,
  "type_id" => type1.id
  })
exhibit1.save()

exhibit2 = Exhibit.new({
  "title" => "Mural on Indian Red Ground",
  "year" => 1950,
  "artist_id" => artist5.id,
  "type_id" => type1.id
  })
exhibit2.save()

exhibit3 = Exhibit.new({
  "title" => "Blue Poles",
  "year" => 1952,
  "artist_id" => artist5.id,
  "type_id" => type1.id
  })
exhibit3.save()

exhibit4 = Exhibit.new({
  "title" => "Doni Tondo",
  "year" => 1507,
  "artist_id" => artist4.id,
  "type_id" => type1.id
  })
exhibit4.save()

exhibit5 = Exhibit.new({
  "title" => "David",
  "year" => 1504,
  "artist_id" => artist4.id,
  "type_id" => type3.id
  })
exhibit5.save()

exhibit6 = Exhibit.new({
  "title" => "The Libyan Sibyl - sketch",
  "year" => 1510,
  "artist_id" => artist4.id,
  "type_id" => type2.id
  })
exhibit6.save()

exhibit7 = Exhibit.new({
  "title" => "Mona Lisa",
  "year" => 1517,
  "artist_id" => artist3.id,
  "type_id" => type1.id
  })
exhibit7.save()

exhibit8 = Exhibit.new({
  "title" => "Vitruvian Man",
  "year" => 1490,
  "artist_id" => artist3.id,
  "type_id" => type2.id
  })
exhibit8.save()

exhibit9 = Exhibit.new({
  "title" => "Codex Atlanticus",
  "year" => 1519,
  "artist_id" => artist3.id,
  "type_id" => type4.id
  })
exhibit9.save()

exhibit10 = Exhibit.new({
  "title" => "Girl with a Mandolin",
  "year" => 1910,
  "artist_id" => artist2.id,
  "type_id" => type1.id
  })
exhibit10.save()

exhibit11 = Exhibit.new({
  "title" => "The Old Guitarist",
  "year" => 1904,
  "artist_id" => artist2.id,
  "type_id" => type1.id
  })
exhibit11.save()

exhibit12 = Exhibit.new({
  "title" => "Guitar",
  "year" => 1914,
  "artist_id" => artist2.id,
  "type_id" => type3.id
  })
exhibit12.save()

exhibit13 = Exhibit.new({
  "title" => "Starry Night over Rhone",
  "year" => 1888,
  "artist_id" => artist1.id,
  "type_id" => type1.id
  })
exhibit13.save()

exhibit14 = Exhibit.new({
  "title" => "Road with Cypress & Star",
  "year" => 1890,
  "artist_id" => artist1.id,
  "type_id" => type1.id
  })
exhibit14.save()

exhibit15 = Exhibit.new({
  "title" => "Self Portrait with Grey Felt Hat",
  "year" => 1888,
  "artist_id" => artist1.id,
  "type_id" => type1.id
  })
exhibit15.save()

relation1 = Relation.new({
  "exhibit_id" => exhibit1.id,
  "category_id" => category1.id
  })
relation1.save()

relation2 = Relation.new({
  "exhibit_id" => exhibit1.id,
  "category_id" => category2.id
  })
relation2.save()

relation3 = Relation.new({
  "exhibit_id" => exhibit1.id,
  "category_id" => category1.id
  })
relation3.save()

relation4 = Relation.new({
  "exhibit_id" => exhibit2.id,
  "category_id" => category2.id
  })
relation4.save()

relation5 = Relation.new({
  "exhibit_id" => exhibit3.id,
  "category_id" => category1.id
  })
relation1.save()

relation6 = Relation.new({
  "exhibit_id" => exhibit3.id,
  "category_id" => category2.id
  })
relation6.save()

relation7 = Relation.new({
  "exhibit_id" => exhibit4.id,
  "category_id" => category12.id
  })
relation7.save()

relation8 = Relation.new({
  "exhibit_id" => exhibit4.id,
  "category_id" => category14.id
  })
relation8.save()

relation9 = Relation.new({
  "exhibit_id" => exhibit5.id,
  "category_id" => category12.id
  })
relation9.save()

relation10 = Relation.new({
  "exhibit_id" => exhibit5.id,
  "category_id" => category14.id
  })
relation10.save()

relation11 = Relation.new({
  "exhibit_id" => exhibit6.id,
  "category_id" => category12.id
  })
relation11.save()

relation12 = Relation.new({
  "exhibit_id" => exhibit6.id,
  "category_id" => category13.id
  })
relation12.save()

relation13 = Relation.new({
  "exhibit_id" => exhibit6.id,
  "category_id" => category14.id
  })
relation13.save()

relation14= Relation.new({
  "exhibit_id" => exhibit7.id,
  "category_id" => category6.id
  })
relation14.save()

relation15 = Relation.new({
  "exhibit_id" => exhibit7.id,
  "category_id" => category12.id
  })
relation15.save()

relation16 = Relation.new({
  "exhibit_id" => exhibit8.id,
  "category_id" => category11.id
  })
relation16.save()

relation17 = Relation.new({
  "exhibit_id" => exhibit8.id,
  "category_id" => category12.id
  })
relation17.save()

relation18 = Relation.new({
  "exhibit_id" => exhibit9.id,
  "category_id" => category10.id
  })
relation18.save()

relation19 = Relation.new({
  "exhibit_id" => exhibit9.id,
  "category_id" => category12.id
  })
relation19.save()

relation20 = Relation.new({
  "exhibit_id" => exhibit10.id,
  "category_id" => category1.id
  })
relation20.save()

relation21 = Relation.new({
  "exhibit_id" => exhibit10.id,
  "category_id" => category5.id
  })
relation21.save()

relation22 = Relation.new({
  "exhibit_id" => exhibit10.id,
  "category_id" => category6.id
  })
relation22.save()

relation23 = Relation.new({
  "exhibit_id" => exhibit11.id,
  "category_id" => category1.id
  })
relation23.save()

relation24 = Relation.new({
  "exhibit_id" => exhibit11.id,
  "category_id" => category6.id
  })
relation24.save()

relation25 = Relation.new({
  "exhibit_id" => exhibit11.id,
  "category_id" => category9.id
  })
relation25.save()

relation26 = Relation.new({
  "exhibit_id" => exhibit12.id,
  "category_id" => category1.id
  })
relation26.save()

relation27 = Relation.new({
  "exhibit_id" => exhibit12.id,
  "category_id" => category5.id
  })
relation27.save()

relation28 = Relation.new({
  "exhibit_id" => exhibit13.id,
  "category_id" => category1.id
  })
relation28.save()

relation29 = Relation.new({
  "exhibit_id" => exhibit13.id,
  "category_id" => category4.id
  })
relation29.save()

relation30 = Relation.new({
  "exhibit_id" => exhibit13.id,
  "category_id" => category8.id
  })
relation30.save()

relation31 = Relation.new({
  "exhibit_id" => exhibit14.id,
  "category_id" => category1.id
  })
relation31.save()

relation32 = Relation.new({
  "exhibit_id" => exhibit14.id,
  "category_id" => category4.id
  })
relation32.save()

relation33 = Relation.new({
  "exhibit_id" => exhibit14.id,
  "category_id" => category8.id
  })
relation33.save()

relation34 = Relation.new({
  "exhibit_id" => exhibit15.id,
  "category_id" => category1.id
  })
relation34.save()

relation35 = Relation.new({
  "exhibit_id" => exhibit15.id,
  "category_id" => category4.id
  })
relation35.save()

relation36 = Relation.new({
  "exhibit_id" => exhibit15.id,
  "category_id" => category7.id
  })
relation36.save()

binding.pry
nil
