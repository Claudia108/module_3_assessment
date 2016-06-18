require 'test_helper'

class StoreTest < ActiveSupport::TestCase

  test "filters stores by distance" do
    VCR.use_cassette('store#find_by') do
      stores = Store.find_by(80202)
      store = stores.first

      assert_equal 15, stores.count
      assert_equal "", store.longName
      assert_equal "", store.city
      assert_equal "", store.distance
      assert_equal "", store.phone
      assert_equal "", store.storeType
    end

  end

end
