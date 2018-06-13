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
  "dob" => "1853-03-30",
  "dod" => "1890-07-29",
  "url" => "https://m.media-amazon.com/images/M/MV5BYzk5ODM5MDEtNjA2YS00Y2U4LWI0YTktY2E2ZDMxY2NlMzhkXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_UY317_CR18,0,214,317_AL_.jpg"
  })
artist1.save()

artist2 = Artist.new({
  "name" => "Pablo Picasso",
  "dob" => "1881-10-25",
  "dod" => "1973-04-08",
  "url" => "https://m.media-amazon.com/images/M/MV5BMzQ5MjgwOTM2Ml5BMl5BanBnXkFtZTgwNjkzNjQyNTM@._V1_SY1000_CR0,0,1019,1000_AL_.jpg"
  })
artist2.save()

artist3 = Artist.new({
  "name" => "Leonardo da Vinci",
  "dob" => "1452-04-15",
  "dod" => "1519-05-02",
  "url" => "https://upload.wikimedia.org/wikipedia/commons/f/f7/Francesco_Melzi_-_Portrait_of_Leonardo_-_WGA14795.jpg"
  })
artist3.save()

artist4 = Artist.new({
  "name" => "Michelangelo",
  "dob" => "1475-03-06",
  "dod" => "1564-02-18",
  "url" => "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Miguel_%C3%81ngel%2C_por_Daniele_da_Volterra_%28detalle%29.jpg/440px-Miguel_%C3%81ngel%2C_por_Daniele_da_Volterra_%28detalle%29.jpg"
  })
artist4.save()

artist5 = Artist.new({
  "name" => "Jackson Pollock",
  "dob" => "1912-01-28",
  "dod" => "1956-08-11",
  "url" => "https://www.jackson-pollock.org/images/jackson_pollock.jpg"
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
  "type_id" => type1.id,
  "url" => "https://www.jackson-pollock.org/images/paintings/autumn-rhythm.jpg"
  })
exhibit1.save()

exhibit2 = Exhibit.new({
  "title" => "Mural on Indian Red Ground",
  "year" => 1950,
  "artist_id" => artist5.id,
  "type_id" => type1.id,
  "url" => "https://www.jackson-pollock.org/images/paintings/mural-on-indian-red-ground.jpg"
  })
exhibit2.save()

exhibit3 = Exhibit.new({
  "title" => "Blue Poles",
  "year" => 1952,
  "artist_id" => artist5.id,
  "type_id" => type1.id,
  "url" => "https://www.jackson-pollock.org/images/paintings/blue-poles.jpg"
  })
exhibit3.save()

exhibit4 = Exhibit.new({
  "title" => "Doni Tondo",
  "year" => 1507,
  "artist_id" => artist4.id,
  "type_id" => type1.id,
  "url" => "https://www.michelangelo.org/images/artworks/doni-tondo.jpg"
  })
exhibit4.save()

exhibit5 = Exhibit.new({
  "title" => "David",
  "year" => 1504,
  "artist_id" => artist4.id,
  "type_id" => type3.id,
  "url" => "https://www.michelangelo.org/david.jsp"
  })
exhibit5.save()

exhibit6 = Exhibit.new({
  "title" => "The Libyan Sibyl - sketch",
  "year" => 1510,
  "artist_id" => artist4.id,
  "type_id" => type2.id,
  "url" => "https://www.metmuseum.org/toah/images/hb/hb_24.197.2.jpg"
  })
exhibit6.save()

exhibit7 = Exhibit.new({
  "title" => "Mona Lisa",
  "year" => 1517,
  "artist_id" => artist3.id,
  "type_id" => type1.id,
  "url" => "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ec/Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg/600px-Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg"
  })
exhibit7.save()

exhibit8 = Exhibit.new({
  "title" => "Vitruvian Man",
  "year" => 1490,
  "artist_id" => artist3.id,
  "type_id" => type2.id,
  "url" => "https://upload.wikimedia.org/wikipedia/commons/thumb/2/22/Da_Vinci_Vitruve_Luc_Viatour.jpg/600px-Da_Vinci_Vitruve_Luc_Viatour.jpg"
  })
exhibit8.save()

exhibit9 = Exhibit.new({
  "title" => "Codex Atlanticus",
  "year" => 1519,
  "artist_id" => artist3.id,
  "type_id" => type4.id,
  "url" => "https://upload.wikimedia.org/wikipedia/commons/8/89/Codice_Atlantico_-_Legatura.jpg"
  })
exhibit9.save()

exhibit10 = Exhibit.new({
  "title" => "Girl with a Mandolin",
  "year" => 1910,
  "artist_id" => artist2.id,
  "type_id" => type1.id,
  "url" => "https://www.pablopicasso.org/images/paintings/girl-with-mandolin.jpg"
  })
exhibit10.save()

exhibit11 = Exhibit.new({
  "title" => "The Old Guitarist",
  "year" => 1904,
  "artist_id" => artist2.id,
  "type_id" => type1.id,
  "url" => "https://www.pablopicasso.org/images/paintings/the-old-guitarist.jpg"
  })
exhibit11.save()

exhibit12 = Exhibit.new({
  "title" => "Guitar",
  "year" => 1914,
  "artist_id" => artist2.id,
  "type_id" => type3.id,
  "url" => "https://www.pablopicasso.org/images/paintings/guitar.jpg"
  })
exhibit12.save()

exhibit13 = Exhibit.new({
  "title" => "Starry Night over Rhone",
  "year" => 1888,
  "artist_id" => artist1.id,
  "type_id" => type1.id,
  "url" => "https://www.vincentvangogh.org/images/paintings/the-starry-night-over-the-rhone.jpg"
  })
exhibit13.save()

exhibit14 = Exhibit.new({
  "title" => "Road with Cypress & Star",
  "year" => 1890,
  "artist_id" => artist1.id,
  "type_id" => type1.id,
  "url" => "https://www.vincentvangogh.org/images/paintings/country-road-with-cypresses.jpg"
  })
exhibit14.save()

exhibit15 = Exhibit.new({
  "title" => "Self Portrait with Grey Felt Hat",
  "year" => 1888,
  "artist_id" => artist1.id,
  "type_id" => type1.id,
  "url" => "https://www.vincentvangogh.org/images/paintings/self-portrait-with-grey-felt-hat.jpg"
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
  "exhibit_id" => exhibit2.id,
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
relation5.save()

relation6 = Relation.new({
  "exhibit_id" => exhibit3.id,
  "category_id" => category2.id
  })
relation6.save()

relation7 = Relation.new({
  "exhibit_id" => exhibit4.id,
  "category_id" => category11.id
  })
relation7.save()

relation8 = Relation.new({
  "exhibit_id" => exhibit4.id,
  "category_id" => category13.id
  })
relation8.save()

relation9 = Relation.new({
  "exhibit_id" => exhibit5.id,
  "category_id" => category11.id
  })
relation9.save()

relation10 = Relation.new({
  "exhibit_id" => exhibit5.id,
  "category_id" => category13.id
  })
relation10.save()

relation11 = Relation.new({
  "exhibit_id" => exhibit6.id,
  "category_id" => category11.id
  })
relation11.save()

relation12 = Relation.new({
  "exhibit_id" => exhibit6.id,
  "category_id" => category12.id
  })
relation12.save()

relation13 = Relation.new({
  "exhibit_id" => exhibit6.id,
  "category_id" => category14.id
  })
relation13.save()

relation14= Relation.new({
  "exhibit_id" => exhibit7.id,
  "category_id" => category5.id
  })
relation14.save()

relation15 = Relation.new({
  "exhibit_id" => exhibit7.id,
  "category_id" => category11.id
  })
relation15.save()

relation16 = Relation.new({
  "exhibit_id" => exhibit8.id,
  "category_id" => category10.id
  })
relation16.save()

relation17 = Relation.new({
  "exhibit_id" => exhibit8.id,
  "category_id" => category11.id
  })
relation17.save()

relation18 = Relation.new({
  "exhibit_id" => exhibit9.id,
  "category_id" => category9.id
  })
relation18.save()

relation19 = Relation.new({
  "exhibit_id" => exhibit9.id,
  "category_id" => category10.id
  })
relation19.save()

relation20 = Relation.new({
  "exhibit_id" => exhibit10.id,
  "category_id" => category1.id
  })
relation20.save()

relation21 = Relation.new({
  "exhibit_id" => exhibit10.id,
  "category_id" => category4.id
  })
relation21.save()

relation22 = Relation.new({
  "exhibit_id" => exhibit10.id,
  "category_id" => category5.id
  })
relation22.save()

relation23 = Relation.new({
  "exhibit_id" => exhibit11.id,
  "category_id" => category1.id
  })
relation23.save()

relation24 = Relation.new({
  "exhibit_id" => exhibit11.id,
  "category_id" => category5.id
  })
relation24.save()

relation25 = Relation.new({
  "exhibit_id" => exhibit11.id,
  "category_id" => category8.id
  })
relation25.save()

relation26 = Relation.new({
  "exhibit_id" => exhibit12.id,
  "category_id" => category1.id
  })
relation26.save()

relation27 = Relation.new({
  "exhibit_id" => exhibit12.id,
  "category_id" => category4.id
  })
relation27.save()

relation28 = Relation.new({
  "exhibit_id" => exhibit13.id,
  "category_id" => category1.id
  })
relation28.save()

relation29 = Relation.new({
  "exhibit_id" => exhibit13.id,
  "category_id" => category3.id
  })
relation29.save()

relation30 = Relation.new({
  "exhibit_id" => exhibit13.id,
  "category_id" => category7.id
  })
relation30.save()

relation31 = Relation.new({
  "exhibit_id" => exhibit14.id,
  "category_id" => category1.id
  })
relation31.save()

relation32 = Relation.new({
  "exhibit_id" => exhibit14.id,
  "category_id" => category3.id
  })
relation32.save()

relation33 = Relation.new({
  "exhibit_id" => exhibit14.id,
  "category_id" => category7.id
  })
relation33.save()

relation34 = Relation.new({
  "exhibit_id" => exhibit15.id,
  "category_id" => category1.id
  })
relation34.save()

relation35 = Relation.new({
  "exhibit_id" => exhibit15.id,
  "category_id" => category3.id
  })
relation35.save()

relation36 = Relation.new({
  "exhibit_id" => exhibit15.id,
  "category_id" => category6.id
  })
relation36.save()

binding.pry
nil
