require 'test_helper'

class UserViewsStoresTest < ActionDispatch::IntegrationTest
  def setup
    Capybara.app = Storedom::Application
  end

  test "user views 15 stores when searching by zip code" do
    stores = Store.find_by("80202")
    visit '/'
    within('.navbar-form') do
      assert page.has_button?("Search")
      fill_in "zip", with: "80202"
      click_button("Search")
    end
    assert_equal '/search', current_path
    assert_equal 15, stores.count

    within('.stores') do
      assert page.has_css?('.store-1')
      assert page.has_css?('.store-14')
    end

    within(".store-1") do
      assert_equal "Best Buy Mobile - Cherry Creek Shopping Center", stores.first.longName
      assert_equal "Denver", stores.first.city
      assert_equal 3.25, stores.first.distance
      assert_equal "303-270-9189", stores.first.phone
      assert_equal "Mobile", stores.first.storeType
    end

    within(".store-14") do
      assert_equal "Best Buy - S.E. Aurora", stores.last.longName
      assert_equal "Aurora", stores.last.city
      assert_equal 18.51, stores.last.distance
      assert_equal "303-693-0166", stores.last.phone
      assert_equal "BigBox", stores.last.storeType
    end
  end
end
