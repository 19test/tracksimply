require 'test_helper'

class PayPerClickCostTest < ActiveSupport::TestCase
  include CostTest

  setup do
    @cost = costs(:ppc)
  end

  test "#visit_cost returns amount per click" do
    assert_equal 0.50, costs(:ppc).visit_cost
  end

  test "#charges returns empty array" do
    assert_equal [], costs(:ppc).charges
  end
end
