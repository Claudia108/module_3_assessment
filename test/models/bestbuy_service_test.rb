require 'test_helper'

class BestbuyServiceTest < ActiveSupport::TestCase
  test "#stores" do
    VCR.use_cassette('stores') do
      service = BestbuyService.new

      stores = service.stores("80202")

      refute stores.nil?
      assert_equal "Best Buy Mobile - Cherry Creek Shopping Center", stores[:stores][0][:longName]
      assert_equal "Denver", stores[:stores][0][:city]
      assert_equal 3.25, stores[:stores][0][:distance]
      assert_equal "303-270-9189", stores[:stores][0][:phone]
      assert_equal "Mobile", stores[:stores][0][:storeType]
    end
  end

  test "#store" do
    VCR.use_cassette('store') do
      service = BestbuyService.new
      store = service.store("211")

      refute store.nil?
      assert_equal "Best Buy - Colorado Blvd", store[:stores][0][:longName]
      assert_equal "BigBox", store  [:stores][0][:storeType]
      assert_equal "4100 E Mexico Ave", store[:stores][0][:address]
      assert_equal "Denver", store[:stores][0][:city]
      assert_equal "CO", store[:stores][0][:region]
      assert_equal "80222", store[:stores][0][:fullPostalCode]
    end
  end
end
