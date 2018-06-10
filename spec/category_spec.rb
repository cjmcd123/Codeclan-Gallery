require("minitest/autorun")
require("minitest/rg")
require("pry")

require_relative("../models/artist.rb")
require_relative("../models/category.rb")
require_relative("../models/exhibit.rb")
require_relative("../models/relation.rb")
require_relative("../models/type.rb")

class CategoryTest < MiniTest::Test

  def setup()
    # method called before all tests to provide data for tests.
    @category = Category.new({
      "category" => "modern art"
      })
  end


  def test_has_category()
    assert_equal("modern art", @artist.category)
  end


end
