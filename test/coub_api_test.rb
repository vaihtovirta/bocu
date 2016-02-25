require 'test_helper'

class CoubApiTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::CoubApi::VERSION
  end
end
