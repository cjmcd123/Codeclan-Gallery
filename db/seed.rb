require_relative("../models/artist.rb")
require_relative("../models/tpye.rb")
require_relative("../models/category.rb")
require_relative("../models/exhibit.rb")
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
  type => "painting"
  })
type1.save()

type2 = Type.new ({
  type => "sketch"
  })
type2.save()

type3 = Type.new ({
  type => "statue"
  })
type3.save()

categor

binding.pry
nil
