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
    @type = Type.new ({
      "type" => "painting"
      })
  end


  def test_type()
    assert_equal("painting", @type.type)
  end


end
