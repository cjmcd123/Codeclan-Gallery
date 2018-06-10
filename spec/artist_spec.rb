require("minitest/autorun")
require("minitest/rg")
require("pry")

require_relative("../models/artist.rb")
require_relative("../models/category.rb")
require_relative("../models/exhibit.rb")
require_relative("../models/relation.rb")
require_relative("../models/type.rb")

class ArtistTest < MiniTest::Test

  def setup()
    # method called before all tests to provide data for tests.
    @artist = Artist.new({
      "name" => "Vincent van Gogh",
      "dob" => "1853-03-30"
      })
  end


  def test_artist_has_name()
    assert_equal("Vincent van Gogh", @artist.name)
  end

  def test_artist_has_dob()
    assert_equal("1853-03-30", @artist.dob)
  end

end
