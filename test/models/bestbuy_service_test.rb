require 'test_helper'

class BestbuyServiceTest < ActiveSupport::TestCase
  test "#stores" do
    VCR.use_cassette('stores') do
      service = BestbuyService.new
      stores = service.raw_stores("80202")

      refute stores.nil?
      assert_equal "Best Buy Mobile - Cherry Creek Shopping Center", stores[:stores][0][:longName]
      assert_equal "Denver", stores[:stores][0][:city]
      assert_equal 3.25, stores[:stores][0][:distance]
      assert_equal "303-270-9189", stores[:stores][0][:phone]
      assert_equal "Mobile", stores[:stores][0][:storeType]
    end
  end
end
