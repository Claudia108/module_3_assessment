require 'test_helper'

class BestbuyServiceTest < ActiveSupport::TestCase
  test "#stores" do
    VCR.use_cassette('stores') do
      service = BestbuyService.new
      stores = service.stores
      refute stores.nil?
      assert_equal "sdf", stores[0][:long_name]
    end
  end
end
