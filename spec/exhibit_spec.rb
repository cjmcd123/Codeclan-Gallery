require("minitest/autorun")
require("minitest/rg")
require("pry")

require_relative("../models/artist.rb")
require_relative("../models/category.rb")
require_relative("../models/exhibit.rb")
require_relative("../models/relation.rb")
require_relative("../models/type.rb")

class TypeTest < MiniTest::Test

  def setup()
    # method called before all tests to provide data for tests.
    @artist = Artist.new({
      "id" => 1,
      "name" => "Vincent van Gogh",
      "dob" => "1853-03-30"
      })

    @type = Type.new ({
      "id" => 1,
      "type" => "painting"
      })

    @exhibit = Exhibit.new({
      "title" => "Autumn Rhythm",
      "year" => 1950,
      "artist_id" => @artist.id,
      "type_id" => @type.id
      })
  end


  def test_exhibit_has_title()
    assert_equal("Autumn Rhythm", @exhibit.title)
  end

  def test_exhibit_has_year()
    assert_equal(1950, @exhibit.year)
  end

  def test_exhibit_has_artist()
    assert_equal(1, @exhibit.id)
  end

  def test_exhibit_has_type()
    assert_equal(1, @exhibit.id)
  end

end
