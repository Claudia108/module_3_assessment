require 'test_helper'

class StoreTest < ActiveSupport::TestCase

  test "filters stores by distance" do
    VCR.use_cassette('store#find_by') do
      stores = Store.find_by("80202")
      store = stores.first

      assert_equal 15, stores.count
      assert_equal "Best Buy Mobile - Cherry Creek Shopping Center", store.longName
      assert_equal "Denver", store.city
      assert_equal 3.25, store.distance
      assert_equal "303-270-9189", store.phone
      assert_equal "Mobile", store.storeType
    end
  end

  test "finds one store by store id" do
    VCR.use_cassette('store#find_one') do
      store = Store.find_one("2740")
      hours = store.hoursAmPm.split("; ")

      assert_equal "Best Buy Mobile - Cherry Creek Shopping Center", store.longName
      assert_equal "Mobile", store.storeType
      assert_equal "3000 East First Ave", store.address
      assert_equal "Denver", store.city
      assert_equal "CO", store.region
      assert_equal "80206", store.fullPostalCode
      assert_equal "Mon: 10am-9pm", hours.first
      assert_equal "Sun: 11am-6pm", hours.last
    end
  end
end
