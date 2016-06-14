require 'test_helper'

class BestbuyServiceTest < ActiveSupport::TestCase
  test "#stores" do
    VCR.use_cassette('stores') do
      service = BestbuyService.new
      stores = service.raw_stores

      refute stores.nil?
      assert_equal "Store", stores[0][:long_name]
    end
  end
end
